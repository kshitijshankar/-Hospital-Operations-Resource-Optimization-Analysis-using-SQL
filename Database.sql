/* =================================================================
   🏥 HOSPITAL HMIS DATABASE
   Project: Hospital Operations & Resource Optimization Analysis
   SQL Server Database Script
   =================================================================

   DATA FILES USED
   -----------------------------------------------------------------
   patient.csv                 -> 30,000 rows
   admission.csv               -> 45,000 rows
   billing.csv                 -> 45,000 rows
   billing_detail.csv          -> 112,402 rows
   patient_diagnostic.csv      -> 63,269 rows
   prescription.csv            -> 73,109 rows
   patient_insurance.csv       -> 21,617 rows
   employee.csv                -> 500 rows
   doctor.csv                  -> 98 rows
   department.csv              -> 11 rows
   ward.csv                    -> 27 rows
   bed.csv                     -> 415 rows
   disease.csv                 -> 20 rows
   diagnostic_test.csv         -> 9 rows
   drug.csv                    -> 250 rows
   drug_inventory.csv          -> 250 rows
   drug_manufacturer.csv       -> 300 rows
   insurance_provider.csv      -> 50 rows
   staff_assignment.csv       -> 207 rows

   IMPORTANT:
   1. Keep all CSV files in ONE folder.
   2. Change @DataPath near the bottom to that folder.
   3. Run this script in SQL Server Management Studio.
   4. The BULK INSERT section requires SQL Server access to the
      folder containing the CSV files.
   ================================================================= */


/* ================================================================
   STEP 1 : CREATE DATABASE
   ================================================================ */

IF DB_ID('Hospital_HMIS') IS NULL
BEGIN
    CREATE DATABASE Hospital_HMIS;
END;

GO

USE Hospital_HMIS;

GO


/* ================================================================
   STEP 2 : CREATE TABLES
   ================================================================ */


/* ------------------------- PATIENT ----------------------------- */

IF OBJECT_ID('dbo.patient', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.patient
    (
        patient_id       INT           NOT NULL,
        gender           VARCHAR(10)   NULL,
        date_of_birth    DATE          NULL,
        blood_group      VARCHAR(5)    NULL,
        city             VARCHAR(100)  NULL,
        contact_number   VARCHAR(30)   NULL,

        CONSTRAINT PK_patient
            PRIMARY KEY (patient_id)
    );
END;

GO


/* ----------------------- DEPARTMENT ---------------------------- */

IF OBJECT_ID('dbo.department', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.department
    (
        department_id    INT           NOT NULL,
        department_name  VARCHAR(100)  NULL,
        department_type  VARCHAR(30)   NULL,
        floor_number     INT           NULL,
        status            VARCHAR(20)   NULL,

        CONSTRAINT PK_department
            PRIMARY KEY (department_id)
    );
END;

GO


/* ------------------------- EMPLOYEE ---------------------------- */

IF OBJECT_ID('dbo.employee', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.employee
    (
        employee_id       INT           NOT NULL,
        employee_name     VARCHAR(100)  NULL,
        gender            VARCHAR(10)   NULL,
        role              VARCHAR(30)   NULL,
        employment_type   VARCHAR(30)   NULL,
        date_of_joining   DATE          NULL,
        department_id     INT           NULL,

        CONSTRAINT PK_employee
            PRIMARY KEY (employee_id),

        CONSTRAINT FK_employee_department
            FOREIGN KEY (department_id)
            REFERENCES dbo.department(department_id)
    );
END;

GO


/* --------------------------- DOCTOR ---------------------------- */

IF OBJECT_ID('dbo.doctor', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.doctor
    (
        doctor_id          INT          NOT NULL,
        employee_id        INT          NOT NULL,
        specialization     VARCHAR(100) NULL,
        qualification      VARCHAR(30)  NULL,
        experience_years   INT          NULL,

        CONSTRAINT PK_doctor
            PRIMARY KEY (doctor_id),

        CONSTRAINT FK_doctor_employee
            FOREIGN KEY (employee_id)
            REFERENCES dbo.employee(employee_id)
    );
END;

GO


/* --------------------------- DISEASE --------------------------- */

IF OBJECT_ID('dbo.disease', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.disease
    (
        disease_id         INT          NOT NULL,
        disease_name       VARCHAR(150) NULL,
        disease_category   VARCHAR(50)  NULL,

        CONSTRAINT PK_disease
            PRIMARY KEY (disease_id)
    );
END;

GO


/* ----------------------------- WARD ---------------------------- */

IF OBJECT_ID('dbo.ward', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.ward
    (
        ward_id            INT          NOT NULL,
        ward_name          VARCHAR(100) NULL,
        ward_type          VARCHAR(30)  NULL,
        total_beds         INT          NULL,
        department_id      INT          NOT NULL,

        CONSTRAINT PK_ward
            PRIMARY KEY (ward_id),

        CONSTRAINT FK_ward_department
            FOREIGN KEY (department_id)
            REFERENCES dbo.department(department_id)
    );
END;

GO


/* ------------------------------ BED ---------------------------- */

IF OBJECT_ID('dbo.bed', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.bed
    (
        bed_id             INT          NOT NULL,
        bed_number         VARCHAR(20)  NULL,
        bed_status         VARCHAR(30)  NULL,
        ward_id            INT          NOT NULL,

        CONSTRAINT PK_bed
            PRIMARY KEY (bed_id),

        CONSTRAINT FK_bed_ward
            FOREIGN KEY (ward_id)
            REFERENCES dbo.ward(ward_id)
    );
END;

GO


/* --------------------------- ADMISSION ------------------------- */

IF OBJECT_ID('dbo.admission', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.admission
    (
        admission_id       INT          NOT NULL,
        admission_date     DATE         NULL,
        discharge_date     DATE         NULL,
        admission_type     VARCHAR(30)  NULL,
        admission_status   VARCHAR(30)  NULL,
        patient_id         INT          NOT NULL,
        department_id      INT          NOT NULL,
        ward_id            INT          NOT NULL,
        bed_id             INT          NOT NULL,
        disease_id         INT          NOT NULL,

        CONSTRAINT PK_admission
            PRIMARY KEY (admission_id),

        CONSTRAINT FK_admission_patient
            FOREIGN KEY (patient_id)
            REFERENCES dbo.patient(patient_id),

        CONSTRAINT FK_admission_department
            FOREIGN KEY (department_id)
            REFERENCES dbo.department(department_id),

        CONSTRAINT FK_admission_ward
            FOREIGN KEY (ward_id)
            REFERENCES dbo.ward(ward_id),

        CONSTRAINT FK_admission_bed
            FOREIGN KEY (bed_id)
            REFERENCES dbo.bed(bed_id),

        CONSTRAINT FK_admission_disease
            FOREIGN KEY (disease_id)
            REFERENCES dbo.disease(disease_id)
    );
END;

GO


/* ---------------------------- BILLING -------------------------- */

IF OBJECT_ID('dbo.billing', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.billing
    (
        bill_id                    INT            NOT NULL,
        bill_date                  DATE           NULL,
        total_amount               DECIMAL(14,2)  NULL,
        insurance_covered_amount   DECIMAL(14,2)  NULL,
        patient_payable_amount     DECIMAL(14,2)  NULL,
        payment_status             VARCHAR(30)    NULL,
        payment_mode               VARCHAR(30)    NULL,
        admission_id               INT            NOT NULL,

        CONSTRAINT PK_billing
            PRIMARY KEY (bill_id),

        CONSTRAINT FK_billing_admission
            FOREIGN KEY (admission_id)
            REFERENCES dbo.admission(admission_id)
    );
END;

GO


/* ------------------------ BILLING DETAIL ----------------------- */

IF OBJECT_ID('dbo.billing_detail', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.billing_detail
    (
        billing_detail_id    INT            NOT NULL,
        charge_type          VARCHAR(30)    NULL,
        reference_id         INT            NULL,
        amount               DECIMAL(14,2)  NULL,
        bill_id              INT            NOT NULL,

        CONSTRAINT PK_billing_detail
            PRIMARY KEY (billing_detail_id),

        CONSTRAINT FK_billing_detail_bill
            FOREIGN KEY (bill_id)
            REFERENCES dbo.billing(bill_id)
    );
END;

GO


/* ---------------------- DIAGNOSTIC TEST ------------------------ */

IF OBJECT_ID('dbo.diagnostic_test', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.diagnostic_test
    (
        test_id              INT            NOT NULL,
        test_name            VARCHAR(100)   NULL,
        test_category        VARCHAR(50)    NULL,
        standard_cost        DECIMAL(12,2)  NULL,
        department_id        INT            NOT NULL,

        CONSTRAINT PK_diagnostic_test
            PRIMARY KEY (test_id),

        CONSTRAINT FK_diagnostic_test_department
            FOREIGN KEY (department_id)
            REFERENCES dbo.department(department_id)
    );
END;

GO


/* ---------------------- PATIENT DIAGNOSTIC --------------------- */

IF OBJECT_ID('dbo.patient_diagnostic', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.patient_diagnostic
    (
        patient_diagnostic_id   INT          NOT NULL,
        test_date               DATE         NULL,
        result_status           VARCHAR(30)  NULL,
        admission_id            INT          NOT NULL,
        test_id                 INT          NOT NULL,
        doctor_id               INT          NOT NULL,

        CONSTRAINT PK_patient_diagnostic
            PRIMARY KEY (patient_diagnostic_id),

        CONSTRAINT FK_patient_diagnostic_admission
            FOREIGN KEY (admission_id)
            REFERENCES dbo.admission(admission_id),

        CONSTRAINT FK_patient_diagnostic_test
            FOREIGN KEY (test_id)
            REFERENCES dbo.diagnostic_test(test_id),

        CONSTRAINT FK_patient_diagnostic_doctor
            FOREIGN KEY (doctor_id)
            REFERENCES dbo.doctor(doctor_id)
    );
END;

GO


/* ------------------------- DRUG MANUFACTURER ------------------- */

IF OBJECT_ID('dbo.drug_manufacturer', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.drug_manufacturer
    (
        manufacturer_id       INT            NOT NULL,
        manufacturer_name     VARCHAR(150)   NULL,
        country               VARCHAR(50)    NULL,
        reliability_rating    DECIMAL(3,1)   NULL,
        contract_status       VARCHAR(30)    NULL,

        CONSTRAINT PK_drug_manufacturer
            PRIMARY KEY (manufacturer_id)
    );
END;

GO


/* ----------------------------- DRUG ---------------------------- */

IF OBJECT_ID('dbo.drug', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.drug
    (
        drug_id               INT            NOT NULL,
        drug_name             VARCHAR(100)   NULL,
        brand_name            VARCHAR(150)   NULL,
        drug_category         VARCHAR(50)    NULL,
        unit_cost             DECIMAL(12,2)  NULL,
        manufacturer_id       INT            NOT NULL,

        CONSTRAINT PK_drug
            PRIMARY KEY (drug_id),

        CONSTRAINT FK_drug_manufacturer
            FOREIGN KEY (manufacturer_id)
            REFERENCES dbo.drug_manufacturer(manufacturer_id)
    );
END;

GO


/* ------------------------ DRUG INVENTORY ----------------------- */

IF OBJECT_ID('dbo.drug_inventory', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.drug_inventory
    (
        inventory_id          INT          NOT NULL,
        current_stock         INT          NULL,
        reorder_level         INT          NULL,
        inventory_status      VARCHAR(30)  NULL,
        last_restock_date     DATE         NULL,
        drug_id               INT          NOT NULL,

        CONSTRAINT PK_drug_inventory
            PRIMARY KEY (inventory_id),

        CONSTRAINT FK_drug_inventory_drug
            FOREIGN KEY (drug_id)
            REFERENCES dbo.drug(drug_id)
    );
END;

GO


/* ---------------------- INSURANCE PROVIDER --------------------- */

IF OBJECT_ID('dbo.insurance_provider', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.insurance_provider
    (
        insurance_provider_id   INT          NOT NULL,
        provider_name           VARCHAR(150) NULL,
        provider_type           VARCHAR(30)  NULL,
        contact_details         VARCHAR(30)  NULL,
        coverage_limit          DECIMAL(14,2) NULL,

        CONSTRAINT PK_insurance_provider
            PRIMARY KEY (insurance_provider_id)
    );
END;

GO


/* ----------------------- PATIENT INSURANCE --------------------- */

IF OBJECT_ID('dbo.patient_insurance', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.patient_insurance
    (
        patient_insurance_id    INT          NOT NULL,
        policy_number            VARCHAR(50)  NULL,
        coverage_percentage      INT          NULL,
        policy_start_date        DATE         NULL,
        policy_end_date          DATE         NULL,
        patient_id               INT          NOT NULL,
        insurance_provider_id    INT          NOT NULL,

        CONSTRAINT PK_patient_insurance
            PRIMARY KEY (patient_insurance_id),

        CONSTRAINT FK_patient_insurance_patient
            FOREIGN KEY (patient_id)
            REFERENCES dbo.patient(patient_id),

        CONSTRAINT FK_patient_insurance_provider
            FOREIGN KEY (insurance_provider_id)
            REFERENCES dbo.insurance_provider(insurance_provider_id)
    );
END;

GO


/* ------------------------ PRESCRIPTION ------------------------- */

IF OBJECT_ID('dbo.prescription', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.prescription
    (
        prescription_id       INT          NOT NULL,
        dosage                VARCHAR(30)  NULL,
        frequency             VARCHAR(50)  NULL,
        duration_days         INT          NULL,
        admission_id          INT          NOT NULL,
        drug_id               INT          NOT NULL,

        CONSTRAINT PK_prescription
            PRIMARY KEY (prescription_id),

        CONSTRAINT FK_prescription_admission
            FOREIGN KEY (admission_id)
            REFERENCES dbo.admission(admission_id),

        CONSTRAINT FK_prescription_drug
            FOREIGN KEY (drug_id)
            REFERENCES dbo.drug(drug_id)
    );
END;

GO


/* ---------------------- STAFF ASSIGNMENT ----------------------- */

IF OBJECT_ID('dbo.staff_assignment', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.staff_assignment
    (
        assignment_id         INT          NOT NULL,
        employee_id           INT          NOT NULL,
        ward_id               INT          NOT NULL,
        shift                 VARCHAR(30)  NULL,

        CONSTRAINT PK_staff_assignment
            PRIMARY KEY (assignment_id),

        CONSTRAINT FK_staff_assignment_employee
            FOREIGN KEY (employee_id)
            REFERENCES dbo.employee(employee_id),

        CONSTRAINT FK_staff_assignment_ward
            FOREIGN KEY (ward_id)
            REFERENCES dbo.ward(ward_id)
    );
END;

GO


/* ================================================================
   STEP 3 : CREATE INDEXES FOR JOIN PERFORMANCE
   ================================================================ */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_admission_patient_id'
      AND object_id = OBJECT_ID('dbo.admission')
)
CREATE INDEX IX_admission_patient_id
ON dbo.admission(patient_id);

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_admission_department_id'
      AND object_id = OBJECT_ID('dbo.admission')
)
CREATE INDEX IX_admission_department_id
ON dbo.admission(department_id);

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_admission_ward_id'
      AND object_id = OBJECT_ID('dbo.admission')
)
CREATE INDEX IX_admission_ward_id
ON dbo.admission(ward_id);

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_billing_admission_id'
      AND object_id = OBJECT_ID('dbo.billing')
)
CREATE INDEX IX_billing_admission_id
ON dbo.billing(admission_id);

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_patient_diagnostic_admission_id'
      AND object_id = OBJECT_ID('dbo.patient_diagnostic')
)
CREATE INDEX IX_patient_diagnostic_admission_id
ON dbo.patient_diagnostic(admission_id);

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'IX_prescription_admission_id'
      AND object_id = OBJECT_ID('dbo.prescription')
)
CREATE INDEX IX_prescription_admission_id
ON dbo.prescription(admission_id);

GO


/* ================================================================
   STEP 4 : LOAD CSV DATA
   ================================================================

   CHANGE ONLY THIS PATH:

       C:\Hospital_HMIS_Data

   Put all 18 CSV files inside this folder.

   Example:
       C:\Hospital_HMIS_Data\patient.csv
       C:\Hospital_HMIS_Data\admission.csv
       C:\Hospital_HMIS_Data\billing.csv
       ...

   SQL Server must have permission to read this folder.
   ================================================================ */

DECLARE @DataPath NVARCHAR(500) = N'C:\Hospital_HMIS_Data';
DECLARE @SQL NVARCHAR(MAX);


/* ----------------------- PARENT TABLES -------------------------- */

SET @SQL = N'
BULK INSERT dbo.patient
FROM ''' + @DataPath + N'\patient.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.department
FROM ''' + @DataPath + N'\department(1).csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.disease
FROM ''' + @DataPath + N'\disease.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.drug_manufacturer
FROM ''' + @DataPath + N'\drug_manufacturer.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.insurance_provider
FROM ''' + @DataPath + N'\insurance_provider.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* ---------------------- SECONDARY TABLES ------------------------ */

SET @SQL = N'
BULK INSERT dbo.employee
FROM ''' + @DataPath + N'\employee(1).csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.ward
FROM ''' + @DataPath + N'\ward.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.diagnostic_test
FROM ''' + @DataPath + N'\diagnostic_test.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.drug
FROM ''' + @DataPath + N'\drug.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* ------------------------- THIRD LEVEL -------------------------- */

SET @SQL = N'
BULK INSERT dbo.doctor
FROM ''' + @DataPath + N'\doctor.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.bed
FROM ''' + @DataPath + N'\bed.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.drug_inventory
FROM ''' + @DataPath + N'\drug_inventory.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* ------------------------- ADMISSION ---------------------------- */

SET @SQL = N'
BULK INSERT dbo.admission
FROM ''' + @DataPath + N'\admission.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* ---------------------- BILLING TABLES ------------------------- */

SET @SQL = N'
BULK INSERT dbo.billing
FROM ''' + @DataPath + N'\billing.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


SET @SQL = N'
BULK INSERT dbo.billing_detail
FROM ''' + @DataPath + N'\billing_detail.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* --------------------- DIAGNOSTIC DATA ------------------------- */

SET @SQL = N'
BULK INSERT dbo.patient_diagnostic
FROM ''' + @DataPath + N'\patient_diagnostic.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* ----------------------- PRESCRIPTION --------------------------- */

SET @SQL = N'
BULK INSERT dbo.prescription
FROM ''' + @DataPath + N'\prescription.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* --------------------- PATIENT INSURANCE ----------------------- */

SET @SQL = N'
BULK INSERT dbo.patient_insurance
FROM ''' + @DataPath + N'\patient_insurance.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;


/* ---------------------- STAFF ASSIGNMENT ----------------------- */

SET @SQL = N'
BULK INSERT dbo.staff_assignment
FROM ''' + @DataPath + N'\staff_assignment.csv''
WITH
(
    FORMAT = ''CSV'',
    FIRSTROW = 2,
    FIELDQUOTE = ''"'',
    TABLOCK
);';
EXEC sp_executesql @SQL;

GO


/* ================================================================
   STEP 5 : VALIDATE DATA
   ================================================================ */

SELECT 'patient' AS Table_Name, COUNT(*) AS Total_Rows
FROM dbo.patient

UNION ALL

SELECT 'department', COUNT(*)
FROM dbo.department

UNION ALL

SELECT 'employee', COUNT(*)
FROM dbo.employee

UNION ALL

SELECT 'doctor', COUNT(*)
FROM dbo.doctor

UNION ALL

SELECT 'disease', COUNT(*)
FROM dbo.disease

UNION ALL

SELECT 'ward', COUNT(*)
FROM dbo.ward

UNION ALL

SELECT 'bed', COUNT(*)
FROM dbo.bed

UNION ALL

SELECT 'admission', COUNT(*)
FROM dbo.admission

UNION ALL

SELECT 'billing', COUNT(*)
FROM dbo.billing

UNION ALL

SELECT 'billing_detail', COUNT(*)
FROM dbo.billing_detail

UNION ALL

SELECT 'diagnostic_test', COUNT(*)
FROM dbo.diagnostic_test

UNION ALL

SELECT 'patient_diagnostic', COUNT(*)
FROM dbo.patient_diagnostic

UNION ALL

SELECT 'prescription', COUNT(*)
FROM dbo.prescription

UNION ALL

SELECT 'drug', COUNT(*)
FROM dbo.drug

UNION ALL

SELECT 'drug_inventory', COUNT(*)
FROM dbo.drug_inventory

UNION ALL

SELECT 'drug_manufacturer', COUNT(*)
FROM dbo.drug_manufacturer

UNION ALL

SELECT 'insurance_provider', COUNT(*)
FROM dbo.insurance_provider

UNION ALL

SELECT 'patient_insurance', COUNT(*)
FROM dbo.patient_insurance

UNION ALL

SELECT 'staff_assignment', COUNT(*)
FROM dbo.staff_assignment

ORDER BY Table_Name;


/* ================================================================
   STEP 6 : QUICK DATABASE CHECK
   ================================================================ */

SELECT
       COUNT(DISTINCT patient_id) AS 'Unique_Patients',
       COUNT(admission_id) AS 'Total_Admissions'
FROM dbo.admission;


SELECT
       SUM(total_amount) AS 'Total_Revenue',
       AVG(total_amount) AS 'Average_Bill_Value'
FROM dbo.billing;


SELECT
       COUNT(bed_id) AS 'Total_Beds',
       SUM(
           CASE
               WHEN bed_status = 'Occupied' THEN 1
               ELSE 0
           END
       ) AS 'Occupied_Beds'
FROM dbo.bed;


/* ================================================================
   DATABASE READY
   ================================================================ */
