"""Offline-compatible app interface (same names as the OpenAI starter).

Uses nlq_system under the hood — no API key needed. Keeps
test_assessment.py working: `from app import run_pipeline`.
"""
from nlq_system import (
    run_pipeline as _run,
    extract_schema,
    validate_read_only as _v,
    friendly_schema,
    DB_PATH,
)

def validate_read_only(sql: str) -> bool:
    ok, _ = _v(sql)
    return ok

def generate_sql(question: str, schema: str = "", error_msg: str = None) -> str:
    """Best-effort offline SQL preview (used only for display/compat)."""
    r = _run(question)
    return r.get("sql", "")

def summarize_results(question, sql, df) -> str:
    r = _run(question)
    return r.get("summary", "")

def run_pipeline(question: str, role: str = None, user=None, db_path: str = None):
    """Ask a business question. Pass role= to enforce finance restrictions.

    Examples:
        run_pipeline("Show me total revenue", role="finance")  # full numbers
        run_pipeline("Show me total revenue", role="viewer")   # denied
        run_pipeline("Which customers ...?", role="marketing") # names shown, amounts masked
    """
    return _run(question, db_path=db_path, role=role, user=user)

if __name__ == "__main__":
    import sys
    args = [a for a in sys.argv[1:] if not a.startswith("--role=")]
    role = next((a.split("=", 1)[1] for a in sys.argv[1:] if a.startswith("--role=")), None)
    q = " ".join(args) or "Show me total revenue"
    res = run_pipeline(q, role=role)
    if "error" in res and "sql" not in res:
        print("ERROR:", res["error"])
    else:
        print("Q:", res["question"])
        print("Role:", res.get("role"), "| Restricted:", res.get("restricted"))
        print("SQL:\n", res["sql"])
        print("SUMMARY:", res["summary"])
        print(res["table"])
