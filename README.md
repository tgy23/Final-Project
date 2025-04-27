# End to End Data Pipeline from Ingestion, Preprocesing to Reporting

## Project Description

This project provides a robust data engineering pipeline that automates the end-to-end process of handling Kaggle datasets, transforming them for analytics, and preparing them for visualization in Mirosoft Power BI. The pipeline is designed to leverage Azure storage for storing, Azure Data Factory for every day batch scheduling  and Databricks, ensuring scalability, efficiency, and seamless integration across platforms.

## About the project:

This study explores the correlation between various student habits and their academic performance. It aims to examine how daily routines, study practices, sleep patterns, time management, and social activities impact academic outcomes, including grades, test scores, and overall engagement in school activities. The project will involve collecting data from students through surveys or interviews, focusing on key habits such as:

- Study techniques and frequency
- Hours spent on academic work outside of school
- Sleep duration and quality
- Time management and organization
- Participation in extracurricular activities
- Social habits (including screen time, social media usage, etc.)

The research aims to uncover patterns and insights that can help students optimize their habits for better academic success. By analyzing the data, the project seeks to identify which habits have the most significant positive or negative impact on performance. Ultimately, the study aims to provide recommendations for students, educators, and parents to improve student well-being and academic outcomes.

### Key Features

1. **Kaggle Dataset Ingestion to Azure Data Lake**  
   - Automates the process of fetching and processing datasets from Kaggle.  
   - Stores the cleaned and preprocessed data in Azure Data Lake for further use.
   - Ingesting data in a batch with Azure Data Factory trigger
  
2. **Data Transfer to Databricks SQL Data Warehouse**  
   - Implements a pipeline to move data from Azure Data Lake to a Databricks SQL-based data warehouse.  
   - Ensures data integrity and consistency during the transfer process.

3. **Data Transformation with Databricks SQL**  
   - Transforms and structures the data within Databricks SQL Data Warehouse.  
   - Prepares the data for use in advanced analytics and Power BI dashboards.

4. **Power BI Integration**  
   - The transformed data is ready for creating powerful, interactive dashboards in Power BI.  
   - Supports business intelligence and data visualization needs.
  
5. **Infrastructure provisioning with Terraform IaC**
   - Resources are provissioned with Terraform IaC.
   - Using Terraform's declarative syntax, infrastructure is defined as code, allowing to version, review, and reuse infrastructure configurations.

### Technology Stack

- **Dataset Source**: Kaggle  
- **Data Storage**: Azure Data Lake
- **Azure Data Factory**: Batch scheduling and orchestration
- **Data Processing**: Apache Spark with Azure Databricks
- **Data warehouse**: Databricks SQL Data Warehouse  
- **Data Visualization**: Power BI  

### Use Cases

- Automating data ingestion and storage for analytics workflows.
- Creating data pipelines for efficient data warehousing and transformation.
- Preparing datasets for business intelligence and visualization.

### Architecture

![1 drawio](https://github.com/user-attachments/assets/5754a7f8-b640-4685-b5ac-e881ce97a34a)


# Data Pipeline Architecture Overview

This architecture provides a structured, scalable, and automated pipeline for transforming raw Kaggle datasets into actionable insights displayed on Power BI dashboards. Below is a detailed description of each layer and its role in the data pipeline:

## 1. Source Layer: Kaggle
- Kaggle serves as the data source for this pipeline.
- The raw datasets are downloaded and prepared for ingestion into the pipeline.
- Datasets may include structured or unstructured data formats.

---

## 2. Ingestion and Orchestration Layer: Azure Data Factory (ADF)
- **Azure Data Factory (ADF)** acts as the ingestion and orchestration tool.
- **Key Features**:
  - Automates the process of fetching raw data from Kaggle with Databricks ingestion notebook.
  - Orchestrates the movement of data into the storage layer.
  - Batch jobs are scheduled daily, ensuring timely data ingestion and updates.
  - Partitioning when transferring data to Azure Data Lake Storage.
- ADF ensures reliability and scalability in data movement across pipeline layers.

How this works with ADF?

- Create data factory resource preferably with IaC tool such as Terraform
  
![image](https://github.com/user-attachments/assets/1c1d3e3c-9477-47c3-88c1-fa3b31ccb7b8)

- Create a linked service.

![image](https://github.com/user-attachments/assets/68e962e5-efa9-44ad-b30a-39ce688fee02)

- Create pipeline with scheduled every day for batch
  
![image](https://github.com/user-attachments/assets/5e948a13-d29a-4bba-a3ce-fcf3cd8aeae9)

---

## 3. Storage Layer: Azure Data Lake with Bronze, Silver, and Gold Containers
To ensure proper data management and processing, the data lake is divided into three distinct layers:

### a. **Bronze Storage Container - incoming container as landing zone**
- Raw data from Kaggle is stored in the **Bronze** container.
- This layer contains unprocessed or minimally cleaned data.
- Retains data in its original format for future auditing or re-processing needs.

### b. **Silver Storage Container - curated container**
- Processed and cleaned data is stored in the **Silver** container.
- Data transformations are applied here to standardize, validate, and clean the data.
- This layer serves as the staging zone for further processing and analysis.

### c. **Gold Storage Container - cleaned container**
- Fully transformed and enriched data is stored in the **Gold** container.
- Data is optimized for analytics and reporting purposes.
- This layer serves as the final source for downstream applications like Power BI.

![image](https://github.com/user-attachments/assets/58179b6b-0df8-4367-ba82-7cca2c30ba7d)

---

## 4. Processing Layer: Databricks and Databricks SQL Warehouse
The processing of data is handled by **Databricks** using Spark and SQL technologies.

### a. **Databricks with Apache Spark**
- Performs advanced data transformations and computations.
- Handles large-scale data processing tasks with ease and efficiency.
- Transforms raw data into structured formats ready for analysis.

### b. **Databricks SQL Warehouse**
- Acts as the data warehouse for storing processed datasets.
- Enables fast querying and supports SQL-based analytics.
- Integrates seamlessly with Power BI for reporting.
  
![image](https://github.com/user-attachments/assets/2d3b645f-9470-48e7-9b62-36cf8cdfff75)


---

## 5. Reporting Layer: Power BI
- The transformed data from the **Gold** storage or **Databricks SQL Warehouse** is visualized in **Power BI**.
- Power BI dashboards provide actionable insights through interactive and visually appealing reports.
- Enables stakeholders to make data-driven decisions with ease.

  Screenshots from the dahsboard
  
  ![image](https://github.com/user-attachments/assets/0ad0661b-7d2c-4885-b1dd-1b774ddd3c70)


  ![image](https://github.com/user-attachments/assets/69063e69-8397-45a1-b4a6-007dcebceafe)

  



### End-to-End Workflow
1. Kaggle datasets are ingested via Azure Data Factory and stored in the Bronze container.
2. Data is processed and moved to Silver and Gold containers for enhanced usability.
3. Databricks performs transformations and stores the data in the Databricks SQL Warehouse.
4. Power BI connects to the Gold container or SQL Warehouse to generate dynamic dashboards.

This architecture ensures a seamless, scalable, and highly efficient data pipeline, supporting batch analytics and business intelligence needs.
