import os
import re
import sqlite3
import pandas as pd
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

DB_PATH = "company_bi.db"

BUSINESS_GLOSSARY = """
Business Rules & Mapping:
- "Premium plans": maps to subscription_tier IN ('Pro', 'Enterprise') or tier = 'Premium'
- "Revenue": SUM(amount) where payment_status = 'Success'
- "Last quarter" / "This month": Use dynamic SQLite date functions (e.g., DATE('now'))
"""

def extract_schema(db_path: str) -> str:
    """Extracts DDL schema dynamically from SQLite."""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table' AND sql IS NOT NULL;")
    tables = cursor.fetchall()
    conn.close()
    return "\n\n".join([t[0] for t in tables])

def validate_read_only(sql: str) -> bool:
    """Ensures SQL query is strictly non-destructive."""
    sql_clean = sql.strip().upper()
    forbidden = ["DROP", "DELETE", "UPDATE", "INSERT", "ALTER", "TRUNCATE"]
    if not (sql_clean.startswith("SELECT") or sql_clean.startswith("WITH")):
        return False
    return not any(re.search(rf"\b{word}\b", sql_clean) for word in forbidden)

def generate_sql(question: str, schema: str, error_msg: str = None) -> str:
    """Generates SQLite SQL using gpt-4o-mini."""
    system_prompt = f"""You are a data engineer. Translate business questions to valid SQLite SQL.

Schema:
{schema}

{BUSINESS_GLOSSARY}

Rules:
- Return ONLY executable SQLite code inside ```sql ``` code block.
- Read-only SELECT/WITH queries only.
- Handle string matching case-insensitively using LOWER() when needed.
"""
    messages = [{"role": "system", "content": system_prompt}]
    if error_msg:
        messages.append({"role": "user", "content": f"Query failed with: {error_msg}\nFix the query for: {question}"})
    else:
        messages.append({"role": "user", "content": question})

    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=messages,
        temperature=0  # Deterministic output
    )
    
    content = response.choices[0].message.content
    match = re.search(r"```sql\s*(.*?)\s*```", content, re.DOTALL)
    return match.group(1).strip() if match else content.strip()

def summarize_results(question: str, sql: str, df: pd.DataFrame) -> str:
    """Translates DataFrame results to a plain English business answer."""
    prompt = f"""Summarize these SQL results for a business stakeholder in 1-2 concise sentences.
Question: {question}
SQL: {sql}
Data Output (Top 5 rows):
{df.head(5).to_string()}
Total records found: {len(df)}
"""
    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.2
    )
    return response.choices[0].message.content

def run_pipeline(question: str):
    schema = extract_schema(DB_PATH)
    conn = sqlite3.connect(DB_PATH)
    error = None
    sql = None

    # Self-correction loop (max 3 attempts)
    for attempt in range(3):
        sql = generate_sql(question, schema, error_msg=error)
        
        if not validate_read_only(sql):
            error = "Security Violation: Only SELECT/WITH queries allowed."
            continue

        try:
            df = pd.read_sql_query(sql, conn)
            conn.close()
            
            # Successful execution -> summarize output
            summary = summarize_results(question, sql, df)
            return {
                "question": question,
                "sql": sql,
                "summary": summary,
                "data": df
            }
        except Exception as e:
            error = str(e)

    conn.close()
    return {"error": f"Failed after 3 attempts. Last error: {error}"}