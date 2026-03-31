# Connected-Vehicles-Azure-Pipeline
End to end data pipeline for connected vehicles, moving data from AWS s3 to Azure Data Factory and Azure Functions and finally to Azure SQL Server


<img width="1687" height="692" alt="Screenshot 2026-03-31 184440" src="https://github.com/user-attachments/assets/fa96ad7b-7aeb-4da4-9f8d-5d89ebcfa85e" />

## Architecture Overview

The pipeline follows a hybrid AWS-Azure architecture using Medallion principles.
Data flows from AWS S3 into Azure Data Lake, where it is validated and transformed
before being loaded into Azure SQL Database for analytics.

## Technologies Used

- AWS S3 – Source data storage  
- Azure Data Factory – Data orchestration  
- Azure Data Lake Storage Gen2 – Data storage (Bronze/Silver layers)  
- Azure Functions – JSON validation  
- Azure SQL Database – Data warehouse (Gold layer)  
- Azure Key Vault – Secrets management  
- Azure Databricks – Data processing (integration setup)  
- SQL Server Management Studio (SSMS) – Database management

## Key Features

- End-to-end hybrid pipeline (AWS → Azure)
- Medallion Architecture (Bronze, Silver, Gold)
- Automated data validation using Azure Functions
- Separation of valid and invalid data (data quality handling)
- Trigger-based pipeline automation
- Secure credential management using Azure Key Vault

## Pipeline Workflow

1. Data Ingestion
JSON files arrive in AWS S3
Azure Data Factory (ADF) copies data into the Landing Zone in Azure

2. Data Validation
An Azure Function validates incoming JSON files
Based on validation:
- Invalid JSON → moved to Rejected Folder
- Valid JSON → moved to Staging Folder

3. Data Loading
A second ADF pipeline processes files from the Staging Folder
Data is loaded into Azure SQL Database

4. Automation
Triggers in ADF are used to automate:
Movement from staging to Azure SQL Database
Scheduled or event-based execution

## Medallion Architecture

### Bronze Layer (Raw Data)
- Source: AWS S3  
- Ingested via ADF into ADLS Gen2  
- Stored as raw JSON (unchanged)  

### Silver Layer (Validated Data)
- JSON validated using Azure Functions  
- Valid data → Staging  
- Invalid data → Rejected  

### Gold Layer (Analytics)
- Clean data loaded into Azure SQL Database  
- Used for reporting and analytics  
Analytics
BI tools
-Azure SQL DB = Gold Layer


