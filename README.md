# 🏥 Hospital HMIS SQL Analysis

> 🧠 **An end-to-end SQL data analytics project that transforms hospital management
> transactions into meaningful patient, admission, bed, department, financial,
> diagnostic and inventory-based business insights.**

[SQL](https://www.microsoft.com/en-us/sql-server)
![image](https://img.shields.io/badge/SQL-Analysis-0078D4?logo=microsoftsqlserver&logoColor=white)
[Microsoft SQL Server](https://www.microsoft.com/en-us/sql-server)
![image](https://img.shields.io/badge/Database-SQL%20Server-CC2927?logo=microsoftsqlserver)
[Data Analytics](https://github.com/)
![image](https://img.shields.io/badge/Project-Data%20Analytics-7B61FF)
[GitHub](https://github.com/)
![image](https://img.shields.io/badge/Portfolio-SQL%20Project-181717?logo=github)

------------------------------------------------------------------------

## 📌 Project at a Glance

| **🧩 Component** | **🔧 Technology / Description** |
|---|---|
| 📊 Project Type | **SQL Data Analytics / Hospital Operations Analysis** |
| 📥 Primary Data | **Hospital HMIS relational dataset** |
| 🗄️ Database | **Microsoft SQL Server** |
| 🔎 Query Language | **SQL / T-SQL** |
| 📈 Analysis | **KPI, univariate, bivariate and multivariate analysis** |
| 🗃️ Tables | **19 interconnected hospital tables** |
| 👥 Patients | **30,000 unique patients** |
| 🏥 Admissions | **45,000 admissions** |
| 🛏️ Beds | **415 beds** |
| 👨‍⚕️ Doctors | **98 doctors** |
| 📅 Data Period | **Hospital admission dataset period** |

------------------------------------------------------------------------

## 🎯 Project Goal

**Convert raw Hospital HMIS data into actionable management intelligence through SQL database management, KPI analysis, dimensional analysis, advanced aggregations, CTEs, subqueries, CASE statements, joins and window functions.**

------------------------------------------------------------------------

## ✨ Key Features

-   👥 **Patient Demand & Admission KPI Analysis**
-   🛏️ **Bed Capacity & Occupancy Analysis**
-   🏥 **Department Performance Analysis**
-   👨‍⚕️ **Doctor & Staff Coverage Analysis**
-   💰 **Hospital Revenue & Billing Analysis**
-   💳 **Payment Mode & Outstanding Amount Analysis**
-   🧪 **Diagnostic Test Volume Analysis**
-   🔬 **Abnormal Diagnostic Result Analysis**
-   💊 **Prescription & Drug Demand Analysis**
-   📦 **Drug Inventory & Low Stock Analysis**
-   🩺 **Disease Category & Admission Analysis**
-   🔗 **Bivariate Relationship Analysis**
-   🧠 **Multivariate Hospital Performance Analysis**
-   📊 **Department, Ward & Resource Utilization Analysis**
-   ⚡ **Revenue per Admission & Derived Metrics**
-   🪟 **SQL Window Functions for Advanced Analysis**
-   📤 **Query Results Exported in CSV Format**
-   📊 **Dashboard-oriented Hospital Reporting**

------------------------------------------------------------------------

## 🏗️ Project Architecture

``` text
📥 Hospital HMIS Dataset
          ↓
🗄️ SQL Server Database
          ↓
📋 19 Interconnected Tables
          ↓
┌─────────────────────────────┐
│                             │
▼                             ▼
📊 KPI Analysis          📈 Univariate Analysis
│                             │
└──────────────┬──────────────┘
               ↓
        🔗 Bivariate Analysis
               ↓
        🧠 Multivariate Analysis
               ↓
        📤 CSV Query Results
               ↓
        📊 Dashboard / Report
               ↓
        🎯 Hospital Management Insights
```

------------------------------------------------------------------------

## 🛠️ Tech Stack

-   🗄️ **Microsoft SQL Server**
-   🔎 **T-SQL / SQL**
-   📊 **SQL Data Analytics**
-   🧮 **Aggregations & Calculated Metrics**
-   🔗 **Relational JOINs**
-   🧠 **CTEs & Subqueries**
-   🪟 **Window Functions**
-   📅 **Date & Time Analysis**
-   📤 **CSV Query Results**
-   📈 **Dashboard & Data Visualization**
-   📝 **GitHub Documentation**

------------------------------------------------------------------------

## 🚀 Getting Started

### 1️⃣ Clone the Repository

``` bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd Hospital-HMIS-SQL-Analysis
```

### 2️⃣ Open SQL Server

Open **SQL Server Management Studio (SSMS)** or another SQL Server-compatible client.

### 3️⃣ Create the Database

Open:

``` text
database/Hospital_HMIS_Database.sql
```

Run the script.

The script creates:

``` text
Hospital_HMIS
```

and the main hospital tables including:

``` text
patient
admission
billing
billing_detail
department
ward
bed
doctor
employee
staff_assignment
diagnostic_test
patient_diagnostic
disease
drug
drug_inventory
drug_manufacturer
insurance_provider
patient_insurance
prescription
```

### 4️⃣ Run the Analysis

Open:

``` text
queries/Queries.sql
```

Run the analysis in this order:

``` text
Phase 1 → KPI Analysis
Phase 2 → Univariate Analysis
Phase 3 → Bivariate Analysis
Phase 4 → Multivariate Analysis
```

### 5️⃣ Review Query Results

The generated outputs can be exported as CSV files and stored in:

``` text
results/
```

The project contains separate result files for:

``` text
KPI_15_Query_Results.csv
UA_15_Query_Results.csv
BA_15_Query_Results.csv
MA_15_Query_Results.csv
```

### 6️⃣ Review the Dashboard

Open the dashboard image and project report included in the repository.

> 💡 **Note:** The exact database/query file locations can be changed
> according to the final GitHub folder structure.

------------------------------------------------------------------------

## 📂 Repository Structure

``` text
Hospital-HMIS-SQL-Analysis/
│
├── 📁 database/
│   └── Hospital_HMIS_Database.sql
│
├── 📁 queries/
│   └── Queries.sql
│
├── 📁 results/
│   ├── 📄 KPI_15_Query_Results.csv
│   ├── 📄 UA_15_Query_Results.csv
│   ├── 📄 BA_15_Query_Results.csv
│   └── 📄 MA_15_Query_Results.csv
│
├── 📁 dashboard/
│   └── Dashboard Image.png
│
├── 📁 reports/
│   └── Hospital_HMIS_Project_Report.pdf
│
├── 📁 dataset/
│   ├── admission.csv
│   ├── billing.csv
│   ├── billing_detail.csv
│   ├── bed.csv
│   ├── department.csv
│   ├── diagnostic_test.csv
│   ├── disease.csv
│   ├── doctor.csv
│   ├── drug.csv
│   ├── drug_inventory.csv
│   ├── drug_manufacturer.csv
│   ├── employee.csv
│   ├── insurance_provider.csv
│   ├── patient.csv
│   ├── patient_diagnostic.csv
│   ├── patient_insurance.csv
│   ├── prescription.csv
│   ├── staff_assignment.csv
│   └── ward.csv
│
├── 📄 README.md
└── 📄 LICENSE
```

------------------------------------------------------------------------

# Table of Contents

1.  Introduction
2.  Project Overview
3.  Problem Statement
4.  Objectives
5.  Scope of the Project
6.  **Data Source** and Data Fields
7.  Data Understanding
8.  System Architecture
9.  Data Model / ER Design
10. **Database** Design
11. Data Cleaning and Preparation
12. Data Classification
13. **SQL** **Analytics**
14. **Python** **Analytics**
15. **Risk Analysis**
16. Dashboard Design
17. Functional Requirements
18. Non-Functional Requirements
19. Project Workflow
20. Testing Strategy
21. **Limitations**
22. **Future Enhancements**
23. Conclusion
24. Suggested Project Folder Structure
25. Key Definitions

------------------------------------------------------------------------

# 1. 📖 Introduction

The **Hospital HMIS SQL Analysis** project is a SQL-based data analytics solution designed to convert raw hospital management records into structured operational intelligence.

The source dataset contains interconnected information covering **patients, admissions, departments, wards, beds, doctors, employees, billing, billing details, diagnostics, prescriptions, drugs, inventory, diseases, insurance providers, patient insurance and drug manufacturers**.

The system is designed around a **Microsoft SQL Server database**, with **T-SQL** providing the main analytical layer. The analysis progresses from basic KPIs to univariate, bivariate and multivariate business analysis.

The final outputs support **patient demand reporting, bed utilization, department performance, financial analysis, diagnostic analysis, inventory monitoring and management-oriented hospital insights**.

------------------------------------------------------------------------

# 2. 🔎 Project Overview

The project follows an end-to-end SQL analytics pipeline:

1.  Load the **Hospital HMIS Dataset**.
2.  Create the **Hospital_HMIS** database.
3.  Create the 19 interconnected hospital tables.
4.  Load hospital records into SQL Server.
5.  Run **Phase 1 KPI Analysis**.
6.  Run **Phase 2 Univariate Analysis**.
7.  Run **Phase 3 Bivariate Analysis**.
8.  Run **Phase 4 Multivariate Analysis**.
9.  Export important query results to **CSV**.
10. Convert analytical outputs into dashboard-ready insights and hospital management recommendations.

------------------------------------------------------------------------

# 3. ❗ Problem Statement

A large hospital management database can make it difficult for administrators to understand the real operational performance behind individual records.

Important questions include:

-   How many unique patients does the hospital serve?
-   How many admissions are recorded?
-   What is the average number of admissions per patient?
-   How effectively are hospital beds being utilized?
-   Which departments handle the highest admission volumes?
-   How many doctors are available relative to admission workload?
-   Which departments generate the highest revenue?
-   What is the average hospital bill value?
-   How much billing amount remains outstanding?
-   Which diagnostic categories have the highest abnormal-result rates?
-   Which drug categories have high demand relative to available stock?
-   How do ward type and staff coverage relate?
-   How do payment modes contribute to hospital revenue?
-   Which disease categories drive admission volume?
-   Which combinations of department, clinical activity and financial metrics require management attention?

The project addresses these questions by using structured **SQL analysis** to convert hospital transactions into clear performance metrics and business insights.

------------------------------------------------------------------------

# 4. 🎯 Objectives

-   Create a structured **SQL Server database** for hospital management data.
-   Store and analyze **30,000 patient records**.
-   Analyze **45,000 admissions**.
-   Calculate patient, admission, bed and operational KPIs.
-   Compare department-level performance.
-   Analyze ward capacity and bed occupancy.
-   Analyze doctor and employee coverage.
-   Evaluate hospital billing and revenue.
-   Identify outstanding billing exposure.
-   Analyze diagnostic test volume and abnormal results.
-   Analyze prescription volume and drug demand.
-   Monitor drug inventory and low-stock conditions.
-   Study relationships between hospital business dimensions.
-   Use **CTEs, subqueries, CASE expressions and window functions** for advanced analysis.
-   Calculate operational efficiency metrics.
-   Generate CSV outputs for reporting and visualization.
-   Produce dashboard-ready hospital management insights.

------------------------------------------------------------------------

# 5. 📦 Scope of the Project

## **5.1 Included**

-   **SQL Server database** creation.
-   19 interconnected hospital tables.
-   Patient analysis.
-   Admission analysis.
-   Department analysis.
-   Ward analysis.
-   Bed utilization analysis.
-   Doctor analysis.
-   Employee and staff assignment analysis.
-   Revenue and billing analysis.
-   Payment analysis.
-   Diagnostic analysis.
-   Disease analysis.
-   Prescription analysis.
-   Drug analysis.
-   Inventory analysis.
-   Insurance-related data structure.
-   Manufacturer-related data structure.
-   KPI analysis.
-   Univariate analysis.
-   Bivariate analysis.
-   Multivariate analysis.
-   Resource utilization analysis.
-   Revenue per admission analysis.
-   Abnormal diagnostic result analysis.
-   Demand-to-stock analysis.
-   SQL query result exports in CSV.
-   Dashboard-oriented reporting.

## **5.2 Optional / Future Extensions**

-   Power BI interactive hospital dashboard.
-   Automated CSV generation.
-   Scheduled SQL reporting.
-   Patient readmission prediction.
-   Length-of-stay forecasting.
-   Bed demand forecasting.
-   Doctor workload optimization.
-   Drug consumption forecasting.
-   Hospital cost and profit analysis.
-   Real-time hospital monitoring.
-   Cloud database deployment.

------------------------------------------------------------------------

# 6. **Data Source** and Data Fields

The project uses the **Hospital HMIS Dataset**, loaded into SQL Server as a relational hospital database.

The database contains 19 interconnected tables.

| Table | Important Fields | Main Use |
|---|---|---|
| `patient` | patient_id, gender, date_of_birth, blood_group, city | Patient demographics |
| `admission` | admission_id, admission_date, discharge_date, admission_type, patient_id, department_id, ward_id, bed_id, disease_id | Admission analysis |
| `billing` | bill_id, bill_date, total_amount, insurance_covered_amount, patient_payable_amount, payment_status, payment_mode, admission_id | Financial analysis |
| `billing_detail` | billing_detail_id, charge_type, reference_id, amount, bill_id | Charge analysis |
| `department` | department_id, department_name, department_type, floor_number, status | Department analysis |
| `ward` | ward_id, ward_name, ward_type, total_beds, department_id | Ward capacity |
| `bed` | bed_id, bed_number, bed_status, ward_id | Bed utilization |
| `doctor` | doctor_id, employee_id, specialization, qualification, experience_years | Doctor analysis |
| `employee` | employee_id, employee_name, gender, role, employment_type, date_of_joining, department_id | Workforce analysis |
| `staff_assignment` | assignment_id, employee_id, ward_id, shift | Staff coverage |
| `diagnostic_test` | test_id, test_name, test_category, standard_cost, department_id | Diagnostic master |
| `patient_diagnostic` | patient_diagnostic_id, test_date, result_status, admission_id, test_id, doctor_id | Diagnostic activity |
| `disease` | disease_id, disease_name, disease_category | Disease analysis |
| `prescription` | prescription_id, dosage, frequency, duration_days, admission_id, drug_id | Prescription analysis |
| `drug` | drug_id, drug_name, brand_name, drug_category, unit_cost, manufacturer_id | Drug master |
| `drug_inventory` | inventory_id, current_stock, reorder_level, inventory_status, last_restock_date, drug_id | Inventory monitoring |
| `drug_manufacturer` | manufacturer_id, manufacturer_name, country, reliability_rating, contract_status | Manufacturer analysis |
| `insurance_provider` | insurance_provider_id, provider_name, provider_type, coverage_limit | Insurance analysis |
| `patient_insurance` | patient_insurance_id, policy_number, coverage_percentage, policy_start_date, policy_end_date, patient_id, insurance_provider_id | Patient insurance |

------------------------------------------------------------------------

# 7. 🧠 Data Understanding

The dataset is a **relational Hospital Management Information System dataset**.

The strongest directly supported analyses are:

-   👥 Patient demographics
-   🏥 Admission demand
-   🛏️ Bed capacity and occupancy
-   🏢 Department workload
-   👨‍⚕️ Doctor coverage
-   👩‍⚕️ Employee and staff coverage
-   💰 Hospital revenue
-   🧾 Billing and outstanding amounts
-   🧪 Diagnostic volume
-   🔬 Abnormal diagnostic results
-   🩺 Disease-category admissions
-   💊 Prescription volume
-   📦 Drug inventory status
-   🏦 Insurance coverage
-   🔗 Multi-dimensional operational analysis

The dataset contains:

-   **30,000 patients**
-   **45,000 admissions**
-   **45,000 billing records**
-   **112,402 billing-detail records**
-   **63,269 patient-diagnostic records**
-   **73,109 prescription records**
-   **21,617 patient-insurance records**
-   **500 employees**
-   **98 doctors**
-   **11 departments**
-   **27 wards**
-   **415 beds**
-   **20 diseases**
-   **9 diagnostic tests**
-   **250 drugs**
-   **250 drug-inventory records**
-   **300 drug manufacturers**
-   **50 insurance providers**
-   **207 staff assignments**

------------------------------------------------------------------------

# 8. 🏗️ System Architecture

The architecture separates database creation, SQL analysis, result generation and presentation.

| Layer | Responsibility | Technology |
|---|---|---|
| 📥 Data Layer | Hospital source records | CSV dataset |
| 🗄️ Database Layer | Structured relational storage | Microsoft SQL Server |
| 🔎 Query Layer | Business analysis | T-SQL |
| 📊 Analytics Layer | KPIs, trends and comparisons | SQL |
| 📤 Output Layer | Query result files | CSV |
| 📈 Visualization Layer | Charts and dashboard | Dashboard / BI tools |
| 📝 Reporting Layer | Documentation | PDF / GitHub README |

## Architecture Flow

``` text
Hospital HMIS Dataset
        |
        v
Hospital_HMIS_Database.sql
        |
        v
Hospital_HMIS
        |
        v
19 Interconnected Tables
        |
        +----------------------+
        |                      |
        v                      v
Phase 1 KPI             Phase 2 Univariate
Analysis                Analysis
        |                      |
        +----------+-----------+
                   |
                   v
           Phase 3 Bivariate
              Analysis
                   |
                   v
          Phase 4 Multivariate
              Analysis
                   |
                   v
              CSV Results
                   |
                   v
            Dashboard / Report
                   |
                   v
          Hospital Management
               Insights
```

------------------------------------------------------------------------

# 9. 🗂️ Data Model / ER Design

The project uses a relational Hospital HMIS design where transactional tables connect to master/reference tables.

### Core Transaction Tables

``` text
patient
admission
billing
billing_detail
patient_diagnostic
prescription
patient_insurance
staff_assignment
drug_inventory
```

### Master / Reference Tables

``` text
department
ward
bed
doctor
employee
diagnostic_test
disease
drug
drug_manufacturer
insurance_provider
```

### Proposed Data Model

``` text
                         +----------------+
                         |    patient     |
                         +-------+--------+
                                 |
                                 v
                         +---------------+
                         |   admission   |
                         +-------+-------+
                                 |
          +----------------------+----------------------+
          |                      |                      |
          v                      v                      v
   +-------------+        +-------------+        +-------------+
   | department  |        |    ward     |        |   disease   |
   +------+------+        +------+------+        +-------------+
          |                      |
          |                      v
          |               +-------------+
          |               |     bed     |
          |               +-------------+
          |
          +----------------------+
                                 |
             +-------------------+-------------------+
             |                   |                   |
             v                   v                   v
        +---------+         +-----------+       +------------+
        | billing |         |diagnostic |       |prescription|
        +---------+         | activity  |       +------+-----+
             |              +-----------+              |
             v                                         v
      +-------------+                              +--------+
      |billing_detail|                             |  drug  |
      +-------------+                              +---+----+
                                                     |
                                                     v
                                             +---------------+
                                             | drug_inventory|
                                             +---------------+

Employee → Doctor / Staff Assignment → Ward / Department
Patient → Insurance → Insurance Provider
Drug → Drug Manufacturer
Diagnostic Test → Department
```

The relational structure allows the SQL project to connect patient activity with operational resources, finance and clinical services.

------------------------------------------------------------------------

# 10. **Database** Design

## **Core Tables**

| Table | Key Fields | Purpose |
|---|---|---|
| `patient` | `patient_id` | Patient master |
| `admission` | `admission_id`, `patient_id` | Central hospital activity table |
| `billing` | `bill_id`, `admission_id` | Admission financial transactions |
| `billing_detail` | `billing_detail_id`, `bill_id` | Detailed charges |
| `department` | `department_id` | Department master |
| `ward` | `ward_id`, `department_id` | Ward structure |
| `bed` | `bed_id`, `ward_id` | Bed capacity and status |
| `doctor` | `doctor_id`, `employee_id` | Doctor information |
| `employee` | `employee_id`, `department_id` | Workforce information |
| `staff_assignment` | `assignment_id`, `employee_id`, `ward_id` | Staff coverage |
| `diagnostic_test` | `test_id`, `department_id` | Diagnostic master |
| `patient_diagnostic` | `patient_diagnostic_id`, `admission_id`, `test_id` | Patient test activity |
| `disease` | `disease_id` | Disease master |
| `prescription` | `prescription_id`, `admission_id`, `drug_id` | Prescription transactions |
| `drug` | `drug_id`, `manufacturer_id` | Drug master |
| `drug_inventory` | `inventory_id`, `drug_id` | Current stock |
| `drug_manufacturer` | `manufacturer_id` | Manufacturer master |
| `insurance_provider` | `insurance_provider_id` | Insurance master |
| `patient_insurance` | `patient_insurance_id`, `patient_id`, `insurance_provider_id` | Patient insurance |

## **Relationship Logic**

The relational model supports:

-   One patient → many admissions.
-   One admission → one billing record.
-   One admission → many billing-detail charges.
-   One department → many admissions.
-   One department → many wards.
-   One ward → many beds.
-   One admission → one assigned ward and bed.
-   One admission → one disease reference.
-   One admission → many diagnostic records.
-   One admission → many prescriptions.
-   One drug → one inventory record.
-   One drug → one manufacturer reference.
-   One employee → one or more staff assignments.
-   One patient → insurance information.
-   One insurance provider → many patient policies.

These relationships are combined through SQL `JOIN`, `GROUP BY`, CTEs and window functions to produce higher-level insights.

------------------------------------------------------------------------

# 11. 🧹 Data Cleaning and Preparation

The SQL database setup prepares the dataset for analysis by:

1.  Creating the required database.
2.  Creating all 19 relational tables.
3.  Defining appropriate SQL data types.
4.  Defining primary keys.
5.  Defining foreign-key relationships.
6.  Loading the hospital CSV records.
7.  Converting date fields into SQL date-compatible values.
8.  Storing financial values in numeric data types.
9.  Storing identifiers using appropriate integer fields.
10. Making the complete dataset directly queryable through T-SQL.

The analytical workflow also validates the relationship between transactional and master tables before producing business metrics.

------------------------------------------------------------------------

# 12. 🏷️ Data Classification

The project classifies the raw hospital data into analytical business dimensions.

| Classification | Examples | Purpose |
|---|---|---|
| 👥 Patient | Gender, blood group, city | Patient profile analysis |
| 🏥 Admission | Type, status, dates | Demand and utilization |
| 🏢 Department | Clinical, Admin, Diagnostic | Department performance |
| 🛏️ Ward | General, Private, Semi-Private, ICU | Capacity analysis |
| 🛌 Bed | Occupied, Available | Occupancy analysis |
| 👨‍⚕️ Doctor | Specialization, experience | Clinical workforce analysis |
| 👩‍⚕️ Employee | Role, employment type | Staff analysis |
| 💰 Billing | Amount, payment status, mode | Financial analysis |
| 🧪 Diagnostics | Test category, result status | Diagnostic analysis |
| 🩺 Disease | Disease name, category | Clinical demand |
| 💊 Drug | Drug category, unit cost | Medicine analysis |
| 📦 Inventory | Current stock, reorder level | Inventory monitoring |
| 🏦 Insurance | Provider, coverage percentage | Insurance analysis |

These classifications allow the same relational database to answer many different hospital management questions.

------------------------------------------------------------------------

# 13. **SQL** **Analytics**

The SQL analysis is divided into four phases.

## **13.1 Phase 1 --- KPI Analysis**

Phase 1 establishes the overall hospital operations baseline.

The project calculates:

1.  👥 Total Unique Patients
2.  🏥 Total Admissions
3.  📊 Average Admissions per Patient
4.  🛏️ Total Bed Capacity
5.  🛌 Bed Occupancy Rate
6.  🏢 Total Active Departments
7.  📈 Average Admissions per Department
8.  👨‍⚕️ Doctor-to-Admission Ratio
9.  💰 Total Hospital Revenue
10. 💵 Average Bill Value
11. 🧾 Outstanding Bill Amount
12. 🧪 Total Diagnostic Tests
13. 🔬 Abnormal Diagnostic Test Rate
14. 📦 Low Stock Drug Rate
15. 💊 Total Prescription Volume

These KPIs provide the executive baseline for the hospital management dashboard.

### Example --- Total Hospital Revenue

``` sql
SELECT
    SUM(total_amount) AS 'Total_Hospital_Revenue'
FROM billing;
```

The KPI uses `SUM(total_amount)` to calculate the total billed hospital revenue.

### Example --- Bed Occupancy Rate

``` sql
WITH Bed_Analysis AS
(
    SELECT
        COUNT(bed_id) AS 'Total_Beds',
        SUM(
            CASE
                WHEN bed_status = 'Occupied' THEN 1
                ELSE 0
            END
        ) AS 'Occupied_Beds'
    FROM bed
)
SELECT
    Total_Beds,
    Occupied_Beds,
    (Occupied_Beds * 100.0 / Total_Beds)
        AS 'Occupancy_Percentage'
FROM Bed_Analysis;
```

------------------------------------------------------------------------

## **13.2 Phase 2 --- Univariate Analysis**

Phase 2 studies individual hospital dimensions independently.

### 👥 Patient

-   Gender distribution
-   Blood group distribution

### 🏥 Admission

-   Admission type distribution
-   Admission status distribution
-   Length of stay distribution

### 🛏️ Beds & Wards

-   Bed status distribution
-   Ward type distribution

### 🏢 Department & Workforce

-   Department type distribution
-   Doctor specialization distribution
-   Employee role distribution

### 💰 Billing

-   Billing amount distribution
-   Payment mode distribution

### 🧪 Diagnostics

-   Diagnostic result distribution

### 💊 Drugs & Inventory

-   Drug category distribution
-   Inventory status distribution

These analyses describe the composition of individual hospital dimensions before relationships are studied.

------------------------------------------------------------------------

## **13.3 Phase 3 --- Bivariate Analysis**

Phase 3 studies relationships between two business dimensions.

### 👥 Patient Demand

-   Admission Type vs Department
-   Gender vs Admission Type
-   Disease Category vs Admission Volume

### 🛏️ Bed Utilization

-   Ward Type vs Bed Occupancy
-   Department vs Bed Capacity
-   Ward Type vs Staff Coverage
-   Ward Type vs Staff-to-Bed Ratio

### 👨‍⚕️ Department Performance

-   Department vs Doctor Count
-   Specialization vs Diagnostic Volume
-   Department vs Revenue per Admission

### 💰 Financial Performance

-   Payment Mode vs Revenue
-   Charge Type vs Total Charge
-   Payment Status vs Outstanding Amount

### 🧪 Diagnostic Operations

-   Test Category vs Abnormal Result Rate

### 💊 Inventory Management

-   Drug Category vs Demand-to-Stock Ratio

This phase moves beyond simple totals and investigates how hospital dimensions behave together.

------------------------------------------------------------------------

## **13.4 Phase 4 --- Multivariate Analysis**

Phase 4 combines multiple business dimensions to produce deeper insights.

### 🔥 Key Analyses

-   🏥 Department + Admission Type + Disease Category
-   👥 Gender + Admission Type + Department
-   🩺 Disease Category + Admission Type + Ward Type
-   🛏️ Department + Ward + Bed Utilization
-   👩‍⚕️ Department + Ward + Shift Staffing
-   👨‍⚕️ Department + Doctors + Admissions
-   🧪 Department + Test Category + Result Status
-   💰 Department + Admission Type + Billing
-   💳 Department + Payment Mode + Payment Status
-   🧾 Department + Charge Type + Charges
-   🔬 Department + Test Category + Abnormal Rate
-   👨‍⚕️ Specialization + Test Category + Diagnostic Results
-   💊 Drug Category + Inventory Status + Prescriptions
-   🏭 Drug Category + Manufacturer + Inventory
-   🧠 Department Scorecard combining operational metrics

The final scorecard combines hospital dimensions and derived metrics to support management drill-down and resource planning.

------------------------------------------------------------------------

# 14. **Python** **Analytics**

Python is **not required for the core SQL analysis**.

The main analytical engine of this project is Microsoft SQL Server and T-SQL.

Python can optionally be used for:

-   📤 Reading exported CSV query results
-   📊 Additional visualization
-   📈 Chart generation
-   🧹 Supporting data preparation
-   📋 Automated reporting
-   📑 Combining multiple SQL outputs
-   🖼️ Creating portfolio-ready visuals

For the core project, the SQL scripts can be executed directly in SQL Server Management Studio.

------------------------------------------------------------------------

# 15. **Risk Analysis**

This project is focused on **hospital operational and resource management**, so risk analysis is treated as an operational-performance extension.

Possible analytical risk indicators include:

| Indicator | Meaning | Data Availability |
|---|---|---|
| 🛏️ Bed Occupancy | Capacity pressure | Available |
| 💰 Outstanding Billing | Financial receivables exposure | Available |
| 📦 Low Stock Rate | Medicine inventory pressure | Available |
| 🔬 Abnormal Result Rate | Diagnostic workload signal | Available |
| 👨‍⚕️ Doctor Workload | Admission workload per doctor | Available |
| 👩‍⚕️ Staff-to-Bed Ratio | Staffing coverage | Available |
| 🏢 Department Workload | Admission concentration | Available |
| 💊 Demand-to-Stock Ratio | Medicine replenishment pressure | Available |

These metrics can help hospital management identify areas where operational capacity, financial collections, staffing or inventory may require attention.

> ⚠️ **Important:** These indicators are management analytics signals, not clinical diagnoses or medical risk scores.

------------------------------------------------------------------------

# 16. 📊 Dashboard Design

The project dashboard is designed to communicate the SQL analysis visually.

The hospital dashboard can include:

-   👥 Total Unique Patients
-   🏥 Total Admissions
-   🛏️ Total Bed Capacity
-   🛌 Bed Occupancy Rate
-   🏢 Active Departments
-   👨‍⚕️ Doctor Count
-   💰 Total Hospital Revenue
-   💵 Average Bill Value
-   🧾 Outstanding Amount
-   🧪 Diagnostic Test Volume
-   🔬 Abnormal Diagnostic Rate
-   💊 Prescription Volume
-   📦 Low Stock Drug Rate
-   🏥 Admissions by Department
-   🛏️ Occupancy by Ward Type
-   💰 Revenue by Department
-   💳 Revenue by Payment Mode
-   🧪 Diagnostic Results
-   💊 Drug Category Demand
-   📊 Department / Resource Scorecards
-   💡 Key Business Insights

### Dashboard Purpose

The dashboard converts SQL query outputs into:

-   KPI cards
-   Ranking charts
-   Trend charts
-   Distribution charts
-   Resource utilization visuals
-   Financial summaries
-   Clinical-operation summaries
-   Inventory monitoring
-   Business recommendations

------------------------------------------------------------------------

# 17. ⚙️ Functional Requirements

The system shall:

1.  Create the SQL Server database.
2.  Create all 19 hospital tables.
3.  Store patient records.
4.  Store admission records.
5.  Store billing records.
6.  Store detailed billing charges.
7.  Analyze patient demographics.
8.  Analyze admission performance.
9.  Analyze department performance.
10. Analyze ward and bed utilization.
11. Analyze doctor and staff coverage.
12. Analyze hospital revenue.
13. Analyze payment and outstanding amounts.
14. Analyze diagnostic activity.
15. Analyze disease categories.
16. Analyze prescription and drug demand.
17. Analyze inventory status.
18. Perform bivariate analysis.
19. Perform multivariate analysis.
20. Export query results to CSV.
21. Provide data for dashboard/reporting.

------------------------------------------------------------------------

# 18. 🛡️ Non-Functional Requirements

### Accuracy

All calculations should be reproducible directly from the stored SQL data.

### Performance

SQL joins and aggregations should remain efficient for the dataset size.

### Usability

Query names, analysis phases and CSV outputs should be easy to understand.

### Maintainability

Database creation and analytical queries are separated into:

``` text
Hospital_HMIS_Database.sql
Queries.sql
```

### Scalability

The design can later be extended with:

-   Additional hospital years
-   Patient history
-   Clinical outcomes
-   Costs
-   Profitability
-   More diagnostic tests
-   Additional medicines
-   Bed history
-   Staffing targets

### Reliability

The database and query files can be rebuilt from the supplied project files, allowing the analysis to be reproduced consistently.

------------------------------------------------------------------------

# 19. 🔄 Project Workflow

``` text
+--------------------------+
| 1. Source Dataset        |
| Hospital HMIS Data       |
+------------+-------------+
             |
             v
+--------------------------+
| 2. Database Setup        |
| Create Hospital_HMIS     |
+------------+-------------+
             |
             v
+--------------------------+
| 3. Table Creation        |
| 19 Relational Tables     |
+------------+-------------+
             |
             v
+--------------------------+
| 4. Data Loading          |
| Hospital Transactions    |
+------------+-------------+
             |
             v
+--------------------------+
| 5. KPI Analysis          |
| Overall Performance      |
+------------+-------------+
             |
             v
+--------------------------+
| 6. Univariate Analysis   |
| Single-Dimension Trends  |
+------------+-------------+
             |
             v
+--------------------------+
| 7. Bivariate Analysis    |
| Dimension Relationships  |
+------------+-------------+
             |
             v
+--------------------------+
| 8. Multivariate Analysis |
| Advanced Analysis        |
+------------+-------------+
             |
             v
+--------------------------+
| 9. CSV Results           |
| Query Output Files       |
+------------+-------------+
             |
             v
+--------------------------+
| 10. Dashboard / Report   |
| Management Insights      |
+--------------------------+
```

------------------------------------------------------------------------

# 20. 🧪 Testing Strategy

| Test | Expected Result |
|---|---|
| 🗄️ Database connection | SQL Server database opens successfully |
| 🏗️ Database creation | `Hospital_HMIS` is created |
| 📋 Table creation | 19 tables are created without errors |
| 🔗 Foreign-key validation | Relationships connect correctly |
| 📥 Data insertion | Hospital records are stored |
| 🔎 Data retrieval | `SELECT` queries return expected records |
| 👥 Patient count | Unique patient count is generated |
| 🏥 Admission count | Admission volume is generated |
| 🛏️ Bed analysis | Bed capacity and occupancy are generated |
| 🏢 Department grouping | Department-level metrics are generated |
| 👨‍⚕️ Doctor grouping | Doctor-level metrics are generated |
| 💰 Revenue calculation | Billing totals are calculated |
| 🧾 Outstanding calculation | Unpaid/outstanding amount is calculated |
| 🧪 Diagnostic analysis | Test volume and result metrics are generated |
| 💊 Prescription analysis | Prescription volume is generated |
| 📦 Inventory analysis | Stock status is generated |
| 🔗 Bivariate analysis | Relationship queries execute |
| 🧠 Multivariate analysis | Advanced queries execute |
| 📤 CSV export | Query outputs can be exported successfully |
| 📈 Dashboard outputs | Results can be visualized correctly |

------------------------------------------------------------------------

# 21. **Limitations**

-   The current analysis is based on the supplied Hospital HMIS dataset.
-   The dataset represents hospital management records and should not be treated as a complete clinical information system.
-   Clinical outcomes and treatment effectiveness are not directly modeled.
-   Patient satisfaction data is not included.
-   Doctor performance should not be interpreted as clinical quality measurement.
-   Revenue analysis is based on billing records available in the dataset.
-   Profit and cost analysis requires additional cost data.
-   Bed status represents the supplied dataset state and may not represent a real-time hospital census.
-   Inventory analysis uses the available stock records and does not model every historical stock movement.
-   Predictive analytics requires additional historical data and modeling.
-   The project is intended for SQL analytics and portfolio demonstration rather than live hospital decision automation.

------------------------------------------------------------------------

# 22. **Future Enhancements**

The project can be extended with:

-   📅 **Multi-year hospital history**
-   🛏️ **Bed demand forecasting**
-   🏥 **Department capacity forecasting**
-   👨‍⚕️ **Doctor workload optimization**
-   👩‍⚕️ **Staff scheduling analytics**
-   💰 **Hospital cost and profit analysis**
-   🧾 **Detailed claims and insurance analytics**
-   🧪 **Diagnostic turnaround-time analysis**
-   💊 **Drug consumption forecasting**
-   📦 **Automated inventory replenishment**
-   🤖 **Predictive admission analysis**
-   🧠 **Readmission prediction**
-   🔴 **Real-time hospital dashboard**
-   🔄 **Automated CSV generation**
-   📊 **Power BI integration**
-   ☁️ **Cloud SQL deployment**
-   🔐 **Role-based hospital reporting**
-   📧 **Automated management reports**

------------------------------------------------------------------------

# 23. ✅ Conclusion

The **Hospital HMIS SQL Analysis** project provides a practical framework for transforming raw hospital management records into structured operational intelligence.

The **SQL Server database** provides a reliable foundation for storing the interconnected hospital data, while the **T-SQL analysis** converts those records into KPIs, rankings, distributions, utilization metrics, financial measures and multidimensional performance insights.

The project demonstrates how SQL can progress from:

> **Raw Hospital Data → Relational Database → KPIs → Univariate Analysis → Bivariate Analysis → Multivariate Analysis → CSV Results → Dashboard → Management Decisions**

The analysis uses practical SQL techniques including **aggregations, `GROUP BY`, `JOIN`, `CASE`, CTEs, subqueries, window functions and derived metrics**.

This makes the project suitable for demonstrating **SQL, data analytics, business intelligence, relational database design and analytical problem-solving skills** in a GitHub portfolio.

------------------------------------------------------------------------

# 24. Suggested Project Folder Structure

``` text
Hospital-HMIS-SQL-Analysis/
│
├── database/
│   └── Hospital_HMIS_Database.sql
│
├── queries/
│   └── Queries.sql
│
├── results/
│   ├── KPI_15_Query_Results.csv
│   ├── UA_15_Query_Results.csv
│   ├── BA_15_Query_Results.csv
│   └── MA_15_Query_Results.csv
│
├── dataset/
│   ├── admission.csv
│   ├── billing.csv
│   ├── billing_detail.csv
│   ├── bed.csv
│   ├── department.csv
│   ├── diagnostic_test.csv
│   ├── disease.csv
│   ├── doctor.csv
│   ├── drug.csv
│   ├── drug_inventory.csv
│   ├── drug_manufacturer.csv
│   ├── employee.csv
│   ├── insurance_provider.csv
│   ├── patient.csv
│   ├── patient_diagnostic.csv
│   ├── patient_insurance.csv
│   ├── prescription.csv
│   ├── staff_assignment.csv
│   └── ward.csv
│
├── dashboard/
│   └── Dashboard Image.png
│
├── reports/
│   └── Hospital_HMIS_Project_Report.pdf
│
├── README.md
└── LICENSE
```

------------------------------------------------------------------------

# 25. Key Definitions

| Term | Definition |
|---|---|
| 👥 **Patient** | Individual registered in the hospital system |
| 🏥 **Admission** | A hospital encounter representing patient admission |
| 🛏️ **Bed** | Individual hospital bed available for patient allocation |
| 🏢 **Department** | Hospital organizational or clinical unit |
| 🏨 **Ward** | Hospital care area containing multiple beds |
| 👨‍⚕️ **Doctor** | Medical professional linked to hospital workforce data |
| 👩‍⚕️ **Employee** | Hospital workforce member |
| 💰 **Revenue** | Total billed amount recorded in hospital billing |
| 🧾 **Bill** | Financial record associated with an admission |
| 🧪 **Diagnostic Test** | Test performed for a patient |
| 🔬 **Abnormal Result** | Diagnostic result classified as abnormal in the dataset |
| 🩺 **Disease Category** | Grouping used to classify diseases |
| 💊 **Prescription** | Medicine instruction associated with an admission |
| 📦 **Inventory** | Current stock information for a drug |
| 🏦 **Insurance Provider** | Organization providing patient insurance coverage |
| 📊 **KPI** | Key Performance Indicator used to summarize hospital performance |
| 🛌 **Bed Occupancy Rate** | Percentage of beds currently classified as occupied |
| 💵 **Revenue per Admission** | Revenue divided by the number of admissions |
| 📈 **Abnormal Result Rate** | Percentage of diagnostic records classified as abnormal |
| 📦 **Demand-to-Stock Ratio** | Prescription demand compared with available drug stock |
| 🧠 **Univariate Analysis** | Analysis of one business dimension at a time |
| 🔗 **Bivariate Analysis** | Analysis of relationships between two dimensions |
| 🧩 **Multivariate Analysis** | Analysis involving multiple dimensions |
| 🪟 **Window Function** | SQL function used for ranking and analytical calculations |
| 🧱 **CTE** | Common Table Expression used to build readable multi-step queries |
| 📤 **CSV Result** | Exported query output used for reporting or visualization |

------------------------------------------------------------------------

## **Technology Summary**

``` text
Data Source      → Hospital HMIS Dataset
Database         → Microsoft SQL Server
Database         → Hospital_HMIS
Tables           → 19 Interconnected Hospital Tables
Query Language   → T-SQL / SQL
Analysis         → KPI + Univariate + Bivariate + Multivariate
Advanced SQL     → JOINs + CTEs + Subqueries + CASE + Window Functions
Output           → CSV Query Results
Visualization    → Dashboard / Charts
Documentation    → GitHub README + PDF Report
```

------------------------------------------------------------------------

# **Project Goal**

**Transform raw Hospital HMIS records into meaningful management intelligence through SQL Server database management, advanced SQL analytics, CSV result generation and dashboard-oriented hospital reporting.**

------------------------------------------------------------------------

## 📌 Important Data Note

The current SQL project is based on the supplied **Hospital HMIS database and query files**.

The database contains:

``` text
Database  → Hospital_HMIS
Tables    → 19 interconnected tables
Patients  → 30,000
Admissions → 45,000
Beds      → 415
Doctors   → 98
Departments → 11
```

The four analytical phases contain:

``` text
Phase 1 → 15 KPIs
Phase 2 → 15 Univariate Analyses
Phase 3 → 15 Bivariate Analyses
Phase 4 → 15 Multivariate Analyses

Total → 60 SQL Analyses
```

The SQL database and query results are the authoritative source for the current repository.

------------------------------------------------------------------------

## 🤝 Future Scope

The project can be extended with:

-   📊 **Power BI interactive hospital dashboard**
-   🛏️ **Bed demand forecasting**
-   👨‍⚕️ **Doctor and staff workload analytics**
-   💰 **Hospital profit and cost analytics**
-   🧾 **Insurance and claims analytics**
-   🧪 **Diagnostic turnaround analysis**
-   💊 **Drug demand forecasting**
-   📦 **Inventory optimization**
-   📅 **Multi-year trend analysis**
-   🤖 **Predictive hospital analytics**
-   🔄 **Automated reporting**
-   ☁️ **Cloud database deployment**
-   🔴 **Real-time hospital monitoring**

------------------------------------------------------------------------

If this project is useful for learning or portfolio purposes, consider giving the repository a **⭐ Star** on GitHub.

**Built with 🗄️ Microsoft SQL Server + 🔎 T-SQL + 📊 Data Analytics + 🏥 Hospital HMIS + 📈 Business Intelligence**
