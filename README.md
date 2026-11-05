\# SaaS Company BI: Natural-Language Query System



A plain-English question interface over a SaaS company's business database. A business user types a question such as \*"Which customers from California bought our premium plans last quarter?"\* and gets a summary, a result table, the SQL used, and an explanation of how the answer was found.



The system is written in Python with no LLM and no API key. It uses a rule-based intent router, a semantic layer that maps business terms onto the database, and role-based access control that hides finance figures from users who should not see them.



\## Features



\- \*\*Natural-language to SQL\*\* for common business questions (customers by state and plan, revenue by quarter, top product, churn risk, campaigns, pipeline, usage).

\- \*\*Semantic layer\*\* that translates the generic physical schema (`table1`..`table12`, `field1`..) into business names like `companies`, `subscriptions`, and `company\_name`.

\- \*\*Read-only safety.\*\* Only `SELECT` and `WITH` queries run. Write keywords such as `DROP`, `DELETE`, `INSERT`, and `ALTER` are blocked.

\- \*\*Role-based access control.\*\* Finance columns (revenue, amounts, MRR, spend) are redacted for roles without finance access, and pure finance aggregates are denied outright.

\- \*\*Self-correcting queries.\*\* If a query fails, the system retries with progressively simpler SQL.

\- \*\*Explainability.\*\* Every answer includes the SQL and a plain-English explanation of the joins and filters used.



\## Project Structure



```

task/

├── nlq\_system.py          # Core pipeline: intents, SQL builders, access control, formatting

├── app.py                 # Thin wrapper exposing run\_pipeline() for tests and callers

├── cli.py                 # Command-line interface for business users

├── build\_db.py            # Builds company\_bi.db (SQLite) from the MySQL-dialect schema and seed data

├── test\_solution.py       # Functional and security checks

├── company\_bi.db          # Generated SQLite database (created by build\_db.py)

├── database agent/

│   └── dataset/

│       ├── schema.sql           # MySQL schema: 12 tables, foreign keys, indexes

│       ├── seed\_data.sql        # Sample data for all tables

│       ├── seed\_database.py     # Loads seed data into a MySQL server (optional)

│       ├── app.py               # Earlier variant of the app

│       └── test\_assessment.py   # Assessment test script

└── dataset/                 # Duplicate schema and seed files

```



\## Database Overview



The schema models a SaaS business across 12 tables:



| Table | Business meaning | Key columns |

|---|---|---|

| `table1` | companies | `field1` company name, `field3` size, `field7` state, `field10` status |

| `table2` | users (people at each company) | `ref1` company, `field3` email |

| `table3` | products | `field1` name, `field2` category |

| `table4` | plans | `field2` tier (free to enterprise), `field4` base price |

| `table5` | product-plan links (many-to-many) | `ref1` product, `ref2` plan |

| `table6` | subscriptions | `ref1` company, `ref2` plan, `field1` status, `field6` MRR |

| `table7` | transactions and invoices | `ref1` subscription, `field2` amount, `field8` payment status, `field10`/`field11` quarter and year |

| `table8` | sales opportunities | `field2` stage, `field4` expected revenue |

| `table9` | marketing campaigns | `field2` type, `field7` spend, `field10` conversions |

| `table10` | campaign attribution | `ref1` company, `ref2` campaign |

| `table11` | product usage metrics | daily and monthly active users, API calls |

| `table12` | customer health scores | `field1` health score, `field2` churn risk, `field5` NPS |



Foreign keys link companies to subscriptions, subscriptions to transactions, plans to products, and so on. Indexes cover the columns used most often in filters and joins, such as company ID, status, dates, and quarter/year.



\*\*Note on naming:\*\* the schema uses generic column names (`field1`, `ref1`) to simulate an unfamiliar database. The semantic layer in `nlq\_system.py` (`TABLES` and `COLUMNS` dictionaries) maps these to business names.



\## Setup



\*\*Requirements:\*\* Python 3.9 or newer. No third-party packages are required. `pandas` is used automatically if installed. `mysql-connector-python` and `python-dotenv` are needed only for `seed\_database.py`.



\### Option 1: Run with SQLite (recommended)



```bash

cd task

python3 build\_db.py        # builds company\_bi.db from the schema and seed data

python3 test\_solution.py   # runs the functional and security checks

```



\### Option 2: Load into MySQL (optional)



1\. Create a `.env` file with your connection details:



&#x20;  ```

&#x20;  DB\_HOST=localhost

&#x20;  DB\_USER=your\_user

&#x20;  DB\_PASSWORD=your\_password

&#x20;  DB\_NAME=saas\_bi\_db

&#x20;  ```



2\. Load the schema into MySQL, then run the seeding script:



&#x20;  ```bash

&#x20;  mysql -u your\_user -p < "database agent/dataset/schema.sql"

&#x20;  python3 "database agent/dataset/seed\_database.py"

&#x20;  ```



Do not commit `.env` to version control. See the `.gitignore` file in this folder.



\## Usage



\### Command line



```bash

python3 cli.py --examples                       # list example questions

python3 cli.py --schema                         # show the business-friendly schema

python3 cli.py --role finance "Show me total revenue"

python3 cli.py --role viewer  "Show me total revenue"   # denied: no finance access

python3 cli.py --role sales   "Show me our pipeline"

python3 cli.py --role finance "A comparison of Q1 vs Q2 growth rates."

```



\### Python



```python

from nlq\_system import run\_pipeline



res = run\_pipeline("Which customers from California bought our premium plans last quarter?",

&#x20;                  role="analyst")

print(res\["summary"])

print(res\["sql"])

print(res\["table"])

```



Each result is a dictionary with these keys: `question`, `intent`, `sql`, `explanation`, `summary`, `table`, `data`, `records`, `columns`, `role`, and `restricted`.



\## Access Control



| Role | Finance columns | Notes |

|---|---|---|

| `admin`, `finance`, `executive`, `ceo`, `cfo`, `analyst` | Full access | Can request total revenue and quarterly comparisons |

| `sales` | Pipeline only (`expected\_revenue`) | Cannot see transaction revenue |

| `marketing`, `support`, `viewer` | None | Finance columns are masked as `\[RESTRICTED]`, and aggregate finance queries are denied |



Calling `run\_pipeline()` without a `role` keeps the legacy behavior of full access, so existing scripts still work. Production code should always pass an explicit role.



\## Supported Questions



| Intent | Example question |

|---|---|

| Premium customers by state | "Which customers from California bought our premium plans last quarter?" |

| Top product | "What's our top-performing product by revenue this month?" |

| Quarterly comparison | "A comparison of Q1 vs Q2 growth rates." |

| Total revenue | "Show me total revenue" |

| Churn and health | "Which customers are at high churn risk?" |

| Campaigns | "Top marketing campaigns by conversions" |

| Pipeline | "Show me our sales opportunities" |

| Usage | "Show me product usage and active users" |

| Customer list | "List all customers from Texas" |



If a question does not match any intent, the system returns a hint with suggested questions.



\## Testing



```bash

python3 test\_solution.py

```



The test script checks that three sample questions return non-empty results and that the security checks hold:



\- `SELECT` is allowed, while `DROP`, `DELETE`, and `INSERT` are blocked.

\- A SQL injection attempt (`'; DROP TABLE table1; --`) does not reach the generated SQL.



\## Known Limitations



These are documented here so the code is clear about its scope.



\- \*\*Rule-based intent detection.\*\* The router uses keyword matching, not language understanding. It handles the listed question patterns well but will not generalize to arbitrary phrasing.

\- \*\*Partly parameterized SQL.\*\* Some builders insert state names and quarter values into the query with f-strings. The state values come from a fixed list and the quarter values come from the data, but the proper fix is to use bound parameters.

\- \*\*Hard-coded period in one intent.\*\* The quarterly comparison is fixed to Q1 and Q2 of 2023 rather than using the data anchors.

\- \*\*Keyword-based write protection.\*\* `validate\_read\_only` checks for forbidden keywords and the `SELECT`/`WITH` prefix. A read-only database user is the stronger control and should be used in production.

\- \*\*`.env` path in `seed\_database.py`.\*\* The script loads `.env` from the `database agent/` folder, while the sample `.env` sits in `dataset/`. Move the file or change the path before running the MySQL option.

\- \*\*Legacy full access.\*\* Calling `run\_pipeline()` with no role grants access to finance data. This is intentional for backward compatibility and should be changed for production use.



\## Possible Extensions



\- Replace the rule-based router with an LLM that converts questions to SQL, keeping the same validation and access-control layers.

\- Use parameterized queries throughout and run them under a read-only database account.

\- Add a web interface or Slack bot on top of `run\_pipeline()`.

\- Add charts for trend-type questions such as quarterly revenue.

\- Add tests for each intent and each role.

