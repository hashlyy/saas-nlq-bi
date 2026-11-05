import sys
sys.path.insert(0, '.')
from app import run_pipeline
test_questions = [
    "Which customers from California bought our premium plans last quarter?",
    "What's our top-performing product by revenue this month?",
    "A comparison of Q1 vs Q2 growth rates."
]
failed = 0
for idx, q in enumerate(test_questions, 1):
    print(f"\n==================== TEST {idx} ====================")
    res = run_pipeline(q)
    if "error" in res and "sql" not in res:
        print(f"FAILED: {res['error']}")
        failed += 1
    else:
        print(f"QUESTION: {res['question']}")
        print(f"SQL:\n{res['sql']}\n")
        print(f"SUMMARY:\n{res['summary']}\n")
        print("DATA PREVIEW:")
        print(res['data'].head())
        assert len(res['data']) > 0, "empty result!"
print(f"\n{'ALL 3 PASSED' if failed==0 else f'{failed} FAILED'}")

# security checks
from nlq_system import validate_read_only
assert validate_read_only("SELECT * FROM table1")[0]
assert not validate_read_only("DROP TABLE table1")[0]
assert not validate_read_only("DELETE FROM table1")[0]
assert not validate_read_only("INSERT INTO table1 VALUES (1)")[0]
r = run_pipeline("'; DROP TABLE table1; --")
assert "table1" not in r.get("sql", "DROP"), "injection leaked into SQL"
print("Security checks passed.")
