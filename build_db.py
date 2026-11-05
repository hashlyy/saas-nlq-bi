"""Build SQLite DB from MySQL-dialect schema.sql + seed_data.sql (stdlib only)."""
import re
import sqlite3
from pathlib import Path

BASE = Path(__file__).parent
CANDIDATES = [
    BASE / "database agent" / "dataset" / "schema.sql",
    BASE / "dataset" / "schema.sql",
]
SEED_CANDIDATES = [
    BASE / "database agent" / "dataset" / "seed_data.sql",
    BASE / "dataset" / "seed_data.sql",
]
DB_PATH = BASE / "company_bi.db"

def find_existing(cands):
    for p in cands:
        if p.exists():
            return p
    raise FileNotFoundError(f"None found: {cands}")

def mysql_to_sqlite(ddl: str) -> str:
    # drop MySQL-only statements
    ddl = re.sub(r"CREATE DATABASE.*?;", "", ddl, flags=re.DOTALL | re.IGNORECASE)
    ddl = re.sub(r"USE\s+\w+;", "", ddl, flags=re.IGNORECASE)
    ddl = re.sub(r"ON UPDATE CURRENT_TIMESTAMP", "", ddl, flags=re.IGNORECASE)
    # ENUM('a','b') -> TEXT CHECK or just TEXT (keep simple: TEXT)
    ddl = re.sub(r"ENUM\s*\([^)]+\)", "TEXT", ddl, flags=re.IGNORECASE)
    ddl = re.sub(r"\bJSON\b", "TEXT", ddl, flags=re.IGNORECASE)
    ddl = re.sub(r"\bBOOLEAN\b", "INTEGER", ddl, flags=re.IGNORECASE)
    ddl = re.sub(r"DECIMAL\s*\(\d+(,\s*\d+)?\)", "REAL", ddl, flags=re.IGNORECASE)
    ddl = re.sub(r"\bINT\b", "INTEGER", ddl, flags=re.IGNORECASE)
    # MySQL TRUE/FALSE defaults stay; SQLite accepts 1/0 but also TRUE/FALSE keywords
    return ddl

def split_statements(sql: str):
    # remove comment-only lines starting with -- but keep inline values containing --
    lines = []
    for line in sql.splitlines():
        s = line.strip()
        if s.startswith("--") or s == "":
            continue
        lines.append(line)
    clean = "\n".join(lines)
    # split on semicolon
    parts = [p.strip() for p in clean.split(";") if p.strip()]
    return parts

def main():
    schema_path = find_existing(CANDIDATES)
    seed_path = find_existing(SEED_CANDIDATES)
    print(f"Schema: {schema_path}")
    print(f"Seed:   {seed_path}")
    if DB_PATH.exists():
        DB_PATH.unlink()
        print("Removed old DB")
    ddl = mysql_to_sqlite(schema_path.read_text(encoding="utf-8", errors="ignore"))
    seed = seed_path.read_text(encoding="utf-8", errors="ignore")
    seed = re.sub(r"USE\s+\w+;", "", seed, flags=re.IGNORECASE)

    conn = sqlite3.connect(str(DB_PATH))
    conn.execute("PRAGMA foreign_keys=OFF;")
    cur = conn.cursor()
    for stmt in split_statements(ddl):
        try:
            cur.execute(stmt)
        except Exception as e:
            print(f"DDL WARN: {e}\n  -> {stmt[:120]}")
    conn.commit()
    n_ok, n_fail = 0, 0
    for stmt in split_statements(seed):
        try:
            cur.execute(stmt)
            n_ok += 1
        except Exception as e:
            n_fail += 1
            print(f"SEED WARN: {e}\n  -> {stmt[:160]}")
    conn.commit()
    conn.execute("PRAGMA foreign_keys=ON;")
    # verify
    for t in [f"table{i}" for i in range(1, 13)]:
        try:
            c = cur.execute(f'SELECT COUNT(*) FROM {t}').fetchone()[0]
            print(f"{t}: {c} rows")
        except Exception as e:
            print(f"{t}: MISSING ({e})")
    conn.close()
    print(f"Built {DB_PATH} (seed stmts ok={n_ok} fail={n_fail})")

if __name__ == "__main__":
    main()
