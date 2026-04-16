# DeepLearning.AI Data Engineering Professional Certificate

This repository contains my coursework, labs, and assignments completed for the [DeepLearning.AI Data Engineering Professional Certificate](https://www.deeplearning.ai/courses/data-engineering/). The certificate covers the full data engineering lifecycle — from source systems and ingestion, to storage, transformation, and serving data for analytics and ML.

> **Certificate:** [View PDF](./Data%20Engineering%20Professional%20Certificate.pdf)

---

## Skills Demonstrated

| Domain | Technologies |
|---|---|
| Cloud Infrastructure | AWS (RDS, EC2, S3, DynamoDB, CloudWatch) |
| Infrastructure as Code | Terraform |
| Pipeline Orchestration | Apache Airflow (TaskFlow API, Dynamic DAGs) |
| Data Quality | Great Expectations |
| Streaming Ingestion | Apache Kafka |
| Batch Ingestion | REST APIs, Pagination, OAuth2 |
| Databases | PostgreSQL, MySQL, Amazon DynamoDB |
| Data Formats | SQL, JSON, Parquet |
| Programming | Python |

---

## Course Structure

### Course 2 — Source Systems, Data Ingestion, and Pipelines


---

#### Week 1 — Database Connectivity & AWS Fundamentals

**Labs:** SQL queries on RDS · DynamoDB operations · S3 data storage

**Assignment: Troubleshooting Database Connectivity on AWS**

Diagnosed and resolved real-world database connectivity issues in a multi-tier AWS environment:
- Identified and fixed network-level failures between an **EC2 bastion host** and an **Amazon RDS (PostgreSQL)** instance
- Corrected misconfigured **security groups** and **IAM permissions**
- Loaded data into RDS via `COPY` from S3 using a custom DDL schema and validated with SQL queries
- Worked hands-on with **DynamoDB** (CRUD operations, table design) and **Amazon S3** (object storage, CSV/JSON ingestion)

---

#### Week 2 — Batch & Streaming Ingestion

**Labs:** Kafka streaming ingestion (producer/consumer patterns)

**Assignment: Batch Data Pipeline from the Spotify API**

Built a production-grade batch ingestion pipeline that extracts music catalog data from the Spotify Web API:
- Implemented **OAuth2 client credentials flow** to authenticate against the API
- Built a **paginated ingestion engine** handling 100+ records across multiple pages using both offset-based and cursor-based (`next` URL) pagination strategies
- Implemented **automatic token refresh** logic to handle 401 expiry errors mid-run
- Extended the pipeline to fetch **album track data** per album using a second API endpoint
- Persisted extracted data as timestamped **JSON files** to avoid collisions between runs
- Explored the **Spotipy SDK** as an alternative to raw `requests`

---

#### Week 3 — DataOps: Infrastructure as Code & Data Quality

**Lab 1: Implementing DataOps with Terraform**

Provisioned a complete cloud infrastructure using **Terraform** as Infrastructure as Code (IaC):
- Defined modular Terraform configurations for networking (VPC, subnets, security groups), a **bastion host EC2 instance**, and a private **Amazon RDS** instance
- Configured **IAM roles and policies** to grant fine-grained access
- Managed remote **Terraform state** via an S3 backend
- Executed the full IaC lifecycle: `init` → `plan` → `apply`

**Lab 2: Monitoring with AWS CloudWatch**

Built an observability layer for a database infrastructure using **CloudWatch**:
- Defined CloudWatch alarms and metrics via Terraform modules
- Monitored RDS instance health and resource utilization

**Assignment: Data Quality with Great Expectations**

Built an end-to-end data validation workflow on a **MySQL taxi-trips database** stored on AWS:
- Configured a **File Data Context** backed by **Amazon S3** (separate buckets for artifacts and DataDocs)
- Connected to a SQL Data Source and defined a **Table Data Asset** from a `trips` table
- Split data into **batches by vendor ID** using GX splitters
- Defined an **Expectation Suite** with multiple assertions: null checks on `pickup_datetime` and `passenger_count`, range validation on `congestion_surcharge`
- Created a **Checkpoint** with `StoreValidationResultAction` and `UpdateDataDocsAction` to persist results and generate human-readable **DataDocs** in S3
- Validated the pipeline end-to-end by deliberately inserting a violating row and observing a failed checkpoint run in DataDocs

---

#### Week 4 — Pipeline Orchestration with Apache Airflow

**Lab 1:** Airflow fundamentals — DAG authoring, task dependencies, retries, and the Airflow UI

**Lab 2:** Airflow best practices — connection management, TaskGroups, idempotency

**Assignment: Advanced ML Pipeline with Data Quality & Dynamic DAGs**

Built a production ML training pipeline for three Mobility-as-a-Service vendors (Alitran, Easy Destiny, ToMyPlaceAI) using **Apache Airflow**:
- Authored a DAG using the **TaskFlow API** (`@task` and `@task.virtualenv` decorators)
- Integrated **Great Expectations** directly into an Airflow task for automated data quality checks before model training
- Implemented a **`BranchPythonOperator`** to conditionally route the DAG: deploy the model if performance metrics pass a threshold, or trigger a low-performance notification otherwise
- Templated the DAG logic and used **JSON configuration files** + a code generator (`generate_dags.py`) to produce **Dynamic DAGs** — one per vendor — from a single template, eliminating code duplication
- Worked with **Parquet-formatted** training and test datasets

---

## Repository Structure

```
.
├── Data Engineering Professional Certificate.pdf
└── Source Systems, Data Ingestion, and Pipelines/
    ├── W1/   ← AWS databases, SQL, DynamoDB, S3
    ├── W2/   ← REST API ingestion, Kafka streaming
    ├── W3/   ← Terraform IaC, CloudWatch, Great Expectations
    └── W4/   ← Apache Airflow, dynamic DAGs, ML pipelines
```

---

## About the Certificate

The **DeepLearning.AI Data Engineering Professional Certificate** is a comprehensive program covering the modern data engineering stack. Topics span the full lifecycle: ingesting data from source systems, building reliable pipelines, applying DataOps practices, and serving clean data for analytics and machine learning.
