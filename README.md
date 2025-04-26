# Data Engineering Pipeline for Kaggle Data to Azure and Databricks

## Project Description

This project provides a robust data engineering pipeline that automates the end-to-end process of handling Kaggle datasets, transforming them for analytics, and preparing them for visualization in Mirosoft Power BI. The pipeline is designed to leverage Azure storage for storing, Azure Data Factory for every day batch scheduling  and Databricks, ensuring scalability, efficiency, and seamless integration across platforms.

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

### Technology Stack

- **Data Storage**: Azure Data Lake
- **Azure Data Factory**: for batch scheduling
- **Data Processing**: Databricks SQL Data Warehouse  
- **Data Visualization**: Power BI  
- **Dataset Source**: Kaggle  

### Use Cases

- Automating data ingestion and storage for analytics workflows.
- Creating data pipelines for efficient data warehousing and transformation.
- Preparing datasets for real-time business intelligence and visualization.

### Architecture

![Untitled Diagram drawio](https://github.com/user-attachments/assets/1209553f-2e9e-484a-9c0e-dcf53f86a26b)

