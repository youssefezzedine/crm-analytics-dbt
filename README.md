# CRM Analytics DBT Pipeline

## Overview
This project is a end-to-end DBT (Data Build Tool) pipeline built to model 
customer service operations data from a CRM platform. It transforms raw 
interaction, case, survey, and quality evaluation data into clean, 
business-ready tables for analytics and reporting.

---

## Business Context
Customer service operations generate data across multiple channels and systems. 
This pipeline consolidates that data to answer key business questions such as:

- What is the average handle time per case by channel and specialist?
- What are the CSAT, FCR, and NPS scores per specialist and team?
- How do internal quality evaluation scores correlate with customer survey ratings?
- Which specialists and teams are performing above or below target?

---

## Data Sources

### CRM Platform Database
| Table | Description |
|---|---|
| `raw_phone_interactions` | Inbound and outbound phone interactions with timestamps and durations |
| `raw_chat_interactions` | Customer-initiated chat interactions via website |
| `raw_email_interactions` | Inbound and outbound email interactions |
| `raw_cases` | Case details including channel type (Phone, Chat, Email) |
| `raw_surveys_sent` | Surveys sent to customers after case closure |
| `raw_survey_responses` | Customer responses including CSAT, FCR, and NPS ratings |

### Service Quality Database
| Table | Description |
|---|---|
| `raw_evaluations` | QA evaluations conducted by the Service Quality team |
| `raw_evaluation_questions` | Individual question ratings within each evaluation |
| `raw_evaluation_types` | Available evaluation type definitions |

### HR Database
| Table | Description |
|---|---|
| `raw_employees` | Employee details across all departments and roles |

---

## Project Structure
crm_analytics/
├── seeds/                        # Simulated raw data (CSV files)
├── models/
│   ├── staging/                  # 1-to-1 cleaned models per source table
│   │   ├── crm/
│   │   ├── quality/
│   │   └── hr/
│   ├── intermediate/             # Joined and unified models
│   └── marts/                    # Final business-ready tables
│       ├── customer_service/     # Fact tables
│       └── dim/                  # Dimension tables

---

## Data Model

### Staging Layer
Cleans and renames raw source tables with no business logic applied.

### Intermediate Layer
| Model | Description |
|---|---|
| `int_interactions__unified` | Unions Phone, Chat and Email interactions into a single table |
| `int_cases__with_interactions` | Joins cases with their associated interactions |
| `int_cases__with_surveys` | Joins cases with survey sent and response data |
| `int_evaluations__with_scores` | Joins evaluations with their question-level scores |

### Marts Layer
| Model | Type | Description |
|---|---|---|
| `fct_interactions` | Fact | All customer interactions across all channels |
| `fct_cases` | Fact | Case-level data with handle time calculation |
| `fct_survey_responses` | Fact | CSAT, FCR and NPS scores per case and specialist |
| `fct_evaluations` | Fact | QA evaluation scores per case and specialist |
| `dim_specialists` | Dimension | Customer service specialist attributes |
| `dim_customers` | Dimension | Customer dimension |

---

## Data Quality
This project includes **57 automated data tests** across all layers covering:
- Uniqueness and not-null checks on all primary keys
- Accepted value validation on channel types and interaction directions
- Referential integrity across staging, intermediate and mart models

---

## Tools & Technologies
- **DBT Core** v1.11.8 — data transformation framework
- **DuckDB** — local analytical database
- **Git & GitHub** — version control
- **Python** 3.12 — runtime environment
- **VS Code** — development environment

---

## How to Run

```bash
# 1. Activate virtual environment
dbt-env\Scripts\activate

# 2. Navigate to project
cd crm_analytics

# 3. Load raw data
dbt seed

# 4. Build all models
dbt run

# 5. Run all tests
dbt test

# 6. Generate documentation
dbt docs generate
dbt docs serve
```

---

## Author
**Youssef Ezzedine**  
[GitHub](https://github.com/youssefezzedine)