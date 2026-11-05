from app import run_pipeline

test_questions = [
    "Which customers from California bought our premium plans last quarter?",
    "What's our top-performing product by revenue this month?",
    "A comparison of Q1 vs Q2 growth rates."
]

for idx, q in enumerate(test_questions, 1):
    print(f"\n==================== TEST {idx} ====================")
    res = run_pipeline(q)
    if "error" in res:
        print(f"FAILED: {res['error']}")
    else:
        print(f"QUESTION: {res['question']}")
        print(f"SQL:\n{res['sql']}\n")
        print(f"SUMMARY:\n{res['summary']}\n")
        print("DATA PREVIEW:")
        print(res['data'].head())