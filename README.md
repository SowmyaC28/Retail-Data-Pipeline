# Retail Data Pipeline with Airflow, DBT on GCP

This project demonstrates an end-to-end data engineering pipeline using Airflow for orchestration, DBT for data transformations, Soda for data quality checks, and Metabase for dashboarding, all running on Google Cloud Platform (GCP).


## Project Overview

The pipeline processes retail invoice data, performing the following steps:

1. Load raw data from a CSV file into Google Cloud Storage
2. Ingest data into BigQuery
3. Perform initial data quality checks
4. Create dimension and fact tables using DBT
5. Conduct data quality checks on the dimensional model
6. Generate analytical reports using DBT
7. Perform final data quality checks on the reports
8. Create a dashboard in Metabase

## Architecture

![architecture](/architecture.png)

- **Data Storage**: Google Cloud Storage, BigQuery
- **Orchestration**: Apache Airflow
- **Data Transformation**: DBT (Data Build Tool)
- **Data Quality**: Soda
- **DBT-Airflow Integration**: Cosmos
- **Visualization**: Metabase

## Workflow

![DAG](/DAG.png)


1. **Raw Data Ingestion**
   - CSV file loaded to Google Cloud Storage
   - Data ingested into BigQuery as `raw_invoices` table

2. **Initial Data Quality Checks**
   - Schema validation
   - Column presence verification

3. **Preliminary Transformations**
   - Creation of `countries` table in BigQuery

4. **Dimensional Modeling**
   - DBT models create dimension tables (customer, product, datetime) and fact table (invoice)
   - Orchestrated using Cosmos integration with Airflow
  
     ![Dimensional Model](/dimensional_model.png)

5. **Data Quality Checks on Dimensional Model**
   - Soda framework performs checks on each table:
     - Schema validation
     - Uniqueness checks
     - Missing value checks
     - Range checks (where applicable)

6. **Analytical Reporting**
   - DBT models generate reports:
     - Total revenue by country
     - Revenue by year and month
     - Quantity of products sold

7. **Final Data Quality Checks**
   - Soda framework performs checks on report tables:
     - Range checks
     - Schema validation

8. **Dashboard Creation**
   - Connection established between BigQuery and Metabase
   - Retail analytics dashboard created in Metabase
  
     ![Image Description](/Dashboard.png)

## Technologies Used

- Apache Airflow
- DBT (Data Build Tool)
- Soda
- Cosmos
- Google Cloud Platform (GCP)
  - Google Cloud Storage
  - BigQuery
- Metabase






