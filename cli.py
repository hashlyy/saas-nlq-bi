"""CLI for business stakeholders — plain English in, answers out."""
import argparse
import sys
sys.path.insert(0, '.')
from nlq_system import run_pipeline, friendly_schema

EXAMPLES = [
    "Which customers from California bought our premium plans last quarter?",
    "What's our top-performing product by revenue this month?",
    "A comparison of Q1 vs Q2 growth rates.",
    "Show me total revenue",
    "Which customers are at high churn risk?",
    "Top marketing campaigns by conversions",
]

ROLES_HELP = ("viewer (default, no finance), marketing, sales (pipeline only), "
              "support, analyst, finance, executive, admin (full)")

def main():
    ap = argparse.ArgumentParser(description="Ask business questions in plain English.")
    ap.add_argument("question", nargs="*", help="Your question in quotes")
    ap.add_argument("--schema", action="store_true", help="Show business-friendly schema and exit")
    ap.add_argument("--examples", action="store_true", help="Show example questions and exit")
    ap.add_argument("--role", default="viewer",
                    help=f"Your role for finance access. {ROLES_HELP}")
    ap.add_argument("--user", default=None, help="Your name (shown in output)")
    args = ap.parse_args()
    if args.schema:
        print(friendly_schema())
        return
    if args.examples or not args.question:
        print("Example questions:")
        for e in EXAMPLES:
            print(f'  - {e}')
        print(f"\nRoles: {ROLES_HELP}")
        print('Example: python cli.py --role finance "Show me total revenue"')
        if not args.question:
            return
    q = " ".join(args.question)
    if not q:
        return
    res = run_pipeline(q, role=args.role, user={"name": args.user, "role": args.role} if args.user else None)
    if "error" in res and "sql" not in res:
        print(f"\nSorry — {res['error']}")
        print(f"(role: {res.get('role')})")
        return
    if "error" in res:
        print(f"\nNote: {res['error']}")
    who = f" ({args.user}, role: {res.get('role')})" if args.user else f" (role: {res.get('role')})"
    print(f"\nQuestion{who}: {res['question']}")
    if res.get("restricted"):
        print("Note: finance figures hidden for your role.")
    print(f"\nAnswer: {res['summary']}")
    print(f"\nData:\n{res['table']}")
    print(f"\nHow I found it: {res['explanation']}")
    print(f"\nSQL (for analysts):\n{res['sql']}")

if __name__ == "__main__":
    main()
