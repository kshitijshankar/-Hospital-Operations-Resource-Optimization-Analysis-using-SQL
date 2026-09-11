/* ================================================================
   🏥 HOSPITAL HMIS PROJECT
   PHASE 1 — KPI ANALYSIS
   END CONSUMER — HOSPITAL MANAGEMENT / ADMINISTRATORS

   BUSINESS PERSPECTIVES:
   👥 Patient Demand
   🛏️ Bed Utilization
   👨‍⚕️ Department Performance
   💰 Financial Performance
   🧪 Diagnostic Operations
   💊 Inventory Management

   TOTAL KPIs: 15
================================================================ */


/* ================================================================
    PATIENT DEMAND
================================================================ */


/* ---------------------------------------------------------------
   KPI 01 — TOTAL UNIQUE PATIENTS

   What is the count of distinct patient_id in the patient table?

---------------------------------------------------------------- */

SELECT
    COUNT(DISTINCT patient_id) AS total_unique_patients
FROM patient;


/* ---------------------------------------------------------------
   KPI 02 — TOTAL ADMISSIONS

   What is the total number of records in the admission table?

   ---------------------------------------------------------------- */

SELECT
    COUNT(*) AS total_admissions
FROM admission;


/* ---------------------------------------------------------------
   KPI 03 — AVERAGE ADMISSIONS PER PATIENT


   What is the ratio between total admissions and unique patients?

---------------------------------------------------------------- */

SELECT
    ROUND(
        COUNT(admission_id) * 1.0
        / COUNT(DISTINCT patient_id),
        2
    ) AS avg_admissions_per_patient
FROM admission;


/* ================================================================
    BED UTILIZATION
================================================================ */


/* ---------------------------------------------------------------
   KPI 04 — TOTAL BED CAPACITY

   What is the sum of total_beds across all wards?

---------------------------------------------------------------- */

SELECT
    SUM(total_beds) AS total_bed_capacity
FROM ward;


/* ---------------------------------------------------------------
   KPI 05 — BED OCCUPANCY RATE

   What percentage of beds have bed_status = 'Occupied'
   compared with total beds?

---------------------------------------------------------------- */

SELECT
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN bed_status = 'Occupied' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS bed_occupancy_rate
FROM bed;


/* ================================================================
    DEPARTMENT PERFORMANCE
================================================================ */


/* ---------------------------------------------------------------
   KPI 06 — TOTAL ACTIVE DEPARTMENTS

   What is the number of departments whose status indicates
   that they are active?

---------------------------------------------------------------- */

SELECT
    COUNT(*) AS active_departments
FROM department
WHERE status = 'Active';


/* ---------------------------------------------------------------
   KPI 07 — AVERAGE ADMISSIONS PER DEPARTMENT

   What is the average number of admissions across departments?

---------------------------------------------------------------- */

SELECT
    ROUND(AVG(department_admissions), 2)
        AS avg_admissions_per_department
FROM
(
    SELECT
        department_id,
        COUNT(admission_id) AS department_admissions
    FROM admission
    GROUP BY department_id
) AS dept;


/* ---------------------------------------------------------------
   KPI 08 — DOCTOR TO ADMISSION RATIO

   What is the ratio of total admissions to total doctors?
 
---------------------------------------------------------------- */

SELECT
    ROUND(
        (SELECT COUNT(*) FROM admission) * 1.0
        /
        (SELECT COUNT(*) FROM doctor),
        2
    ) AS admissions_per_doctor;


/* ================================================================
   FINANCIAL PERFORMANCE
================================================================ */


/* ---------------------------------------------------------------
   KPI 09 — TOTAL HOSPITAL REVENUE

   What is the sum of total_amount from the billing table?

---------------------------------------------------------------- */

SELECT
    ROUND(SUM(total_amount), 2) AS total_hospital_revenue
FROM billing;


/* ---------------------------------------------------------------
   KPI 10 — AVERAGE BILL VALUE

   What is the average of total_amount in the billing table?

---------------------------------------------------------------- */

SELECT
    ROUND(AVG(total_amount), 2) AS average_bill_value
FROM billing;


/* ---------------------------------------------------------------
   KPI 11 — OUTSTANDING BILL AMOUNT

   What is the total patient_payable_amount for bills
   that have not been paid?

---------------------------------------------------------------- */

SELECT
    ROUND(
        SUM(patient_payable_amount),
        2
    ) AS outstanding_bill_amount
FROM billing
WHERE payment_status <> 'Paid';


/* ================================================================
    DIAGNOSTIC OPERATIONS
================================================================ */


/* ---------------------------------------------------------------
   KPI 12 — TOTAL DIAGNOSTIC TESTS PERFORMED

   What is the total number of records in patient_diagnostic?

---------------------------------------------------------------- */

SELECT
    COUNT(*) AS total_diagnostic_tests
FROM patient_diagnostic;


/* ---------------------------------------------------------------
   KPI 13 — ABNORMAL DIAGNOSTIC TEST RATE

   What percentage of diagnostic records have
   result_status = 'Abnormal'?

---------------------------------------------------------------- */

SELECT
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN result_status = 'Abnormal' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS abnormal_test_rate
FROM patient_diagnostic;


/* ================================================================
   💊 INVENTORY MANAGEMENT
================================================================ */


/* ---------------------------------------------------------------
   KPI 14 — LOW STOCK DRUG RATE

   What percentage of inventory records have
   inventory_status = 'Low'?

---------------------------------------------------------------- */

SELECT
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN inventory_status = 'Low' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS low_stock_drug_rate
FROM drug_inventory;


/* ---------------------------------------------------------------
   KPI 15 — TOTAL PRESCRIPTION VOLUME

   How many prescriptions have been issued by the hospital?


---------------------------------------------------------------- */

SELECT
    COUNT(*) AS total_prescription_volume
FROM prescription;


/* ================================================================
   📊 PHASE 1 KPI SUMMARY

   01. Total Unique Patients
   02. Total Admissions
   03. Average Admissions per Patient
   04. Total Bed Capacity
   05. Bed Occupancy Rate
   06. Total Active Departments
   07. Average Admissions per Department
   08. Doctor-to-Admission Ratio
   09. Total Hospital Revenue
   10. Average Bill Value
   11. Outstanding Bill Amount
   12. Total Diagnostic Tests
   13. Abnormal Diagnostic Test Rate
   14. Low Stock Drug Rate
   15. Total Prescription Volume

================================================================ */

/* =================================================================
   🏥 HOSPITAL HMIS PROJECT
   PHASE 2 — UNIVARIATE ANALYSIS

   END CONSUMER:
   Hospital Management / Administrators

   BUSINESS PERSPECTIVES:
   👥 Patient Demand
   🛏️ Bed Utilization
   👨‍⚕️ Department Performance
   💰 Financial Performance
   🧪 Diagnostic Operations
   💊 Inventory Management

   TOTAL ANALYSES = 15

================================================================= */


/* ================================================================
   👥 PATIENT DEMAND
================================================================ */


/* ----------------------------------------------------------------
   UA 01 — PATIENT GENDER DISTRIBUTION

   How many patients belong to each gender category?

---------------------------------------------------------------- */

Select 
        Gender,
        count(*) AS 'Patient_Count'
        From patient
        Group by Gender 
        Order by Patient_Count Desc


/* ----------------------------------------------------------------
   UA 02 — PATIENT BLOOD GROUP DISTRIBUTION

   What is the distribution of patients across different
   blood groups?

---------------------------------------------------------------- */

Select 
        blood_group,
        count(*) AS 'Patiend_Count'
        From patient
        Group by blood_group
        Order by Patiend_Count Desc


/* ----------------------------------------------------------------
   UA 03 — ADMISSION TYPE DISTRIBUTION

   What type of admissions does the hospital receive most often?

---------------------------------------------------------------- */
Select 
        admission_type,
        Count(*) AS 'Patient_Count'
        From admission
        Group by admission_type
        Order by Patient_Count Desc


/* ----------------------------------------------------------------
   UA 04 — ADMISSION STATUS DISTRIBUTION

   What is the current distribution of admission outcomes/status?

---------------------------------------------------------------- */

SELECT
    admission_status,
    count(*) as 'Patient_count'
    From admission
    Group by admission_status
    Order by Patient_count Desc


/* ================================================================
   🛏️ BED UTILIZATION
================================================================ */


/* ----------------------------------------------------------------
   UA 05 — BED STATUS DISTRIBUTION

   What is the current availability status of hospital beds?

---------------------------------------------------------------- */

SELECT
    bed_status,
    COUNT(*) AS bed_count
FROM bed
GROUP BY bed_status
ORDER BY bed_count DESC;


/* ----------------------------------------------------------------
   UA 06 — WARD TYPE DISTRIBUTION

   What is the composition of hospital wards by type?

---------------------------------------------------------------- */

SELECT
    ward_type,
    COUNT(*) AS ward_count
FROM ward
GROUP BY ward_type
ORDER BY ward_count DESC;


/* ----------------------------------------------------------------
   UA 07 — LENGTH OF STAY DISTRIBUTION

   How are admissions distributed across different
   length-of-stay ranges?


---------------------------------------------------------------- */

Select 
        case 
            When DATEDIFF(Day,admission_date,discharge_date) = 0 Then 'Same_Day'
            When DATEDIFF(Day,admission_date,discharge_date) < 4 then '1- 3 Days'
            When DATEDIFF(Day,admission_date,discharge_date) < 8 then '4-7 Days'
            When DATEDIFF(Day,admission_date,discharge_date) < 15 then '8-14 Days'
        Else '15+Days'
        End AS 'length-of-stay ranges',
        count(*) AS 'Patient_Count'
        From admission
        Group by 
                 case 
            When DATEDIFF(Day,admission_date,discharge_date) = 0 Then 'Same_Day'
            When DATEDIFF(Day,admission_date,discharge_date) < 4 then '1- 3 Days'
            When DATEDIFF(Day,admission_date,discharge_date) < 8 then '4-7 Days'
            When DATEDIFF(Day,admission_date,discharge_date) < 15 then '8-14 Days'
        Else '15+Days'
        End 
        Order by Patient_Count Desc

/* ================================================================
   👨‍⚕️ DEPARTMENT PERFORMANCE
================================================================ */


/* ----------------------------------------------------------------
   UA 08 — DEPARTMENT TYPE DISTRIBUTION

   What is the composition of the hospital's departments?

---------------------------------------------------------------- */

SELECT
    department_type,
    COUNT(*) AS department_count
FROM department
GROUP BY department_type
ORDER BY department_count DESC;


/* ----------------------------------------------------------------
   UA 09 — DOCTOR SPECIALIZATION DISTRIBUTION

   How many doctors belong to each specialization?

---------------------------------------------------------------- */

SELECT
    specialization,
    COUNT(*) AS doctor_count
FROM doctor
GROUP BY specialization
ORDER BY doctor_count DESC;


/* ----------------------------------------------------------------
   UA 10 — EMPLOYEE ROLE DISTRIBUTION

   How many employees belong to each role?

---------------------------------------------------------------- */

SELECT
    role,
    COUNT(*) AS employee_count
FROM employee
GROUP BY role
ORDER BY employee_count DESC;


/* ================================================================
   💰 FINANCIAL PERFORMANCE
================================================================ */


/* ----------------------------------------------------------------
   UA 11 — BILLING AMOUNT DISTRIBUTION

   How many bills fall into each billing amount range?

---------------------------------------------------------------- */

SELECT
    CASE
        When total_amount < 11000 Then '5k-10k'
        When total_amount < 26000 Then '10k-25k'
        When total_amount < 51000 Then  '25k-50k'
    Else '50k+'
    End as 'Billing_Amount_Range',
    count(*) 'Bill_Count'
    From billing
    Group by CASE
        When total_amount < 11000 Then '5k-10k'
        When total_amount < 26000 Then '10k-25k'
        When total_amount < 51000 Then  '25k-50k'
    Else '50k+'
    End
    Order by Bill_Count Desc


/* ----------------------------------------------------------------
   UA 12 — PAYMENT MODE DISTRIBUTION

   Which payment methods are most commonly used
   for hospital bills?

---------------------------------------------------------------- */

SELECT
    payment_mode,
    COUNT(*) AS bill_count
FROM billing
GROUP BY payment_mode
ORDER BY bill_count DESC;


/* ================================================================
   🧪 DIAGNOSTIC OPERATIONS
================================================================ */


/* ----------------------------------------------------------------
   UA 13 — DIAGNOSTIC RESULT DISTRIBUTION

   What is the overall distribution of diagnostic results?

---------------------------------------------------------------- */

SELECT
    result_status,
    COUNT(*) AS diagnostic_count
FROM patient_diagnostic
GROUP BY result_status
ORDER BY diagnostic_count DESC;


/* ================================================================
   💊 INVENTORY MANAGEMENT
================================================================ */


/* ----------------------------------------------------------------
   UA 14 — DRUG CATEGORY DISTRIBUTION

   What types of medicines make up the hospital's drug inventory?

---------------------------------------------------------------- */

SELECT
    drug_category,
    COUNT(*) AS drug_count
FROM drug
GROUP BY drug_category
ORDER BY drug_count DESC;


/* ----------------------------------------------------------------
   UA 15 — INVENTORY STATUS DISTRIBUTION

   What is the current inventory health of the hospital's drugs?

---------------------------------------------------------------- */

SELECT
    inventory_status,
    COUNT(*) AS inventory_count
FROM drug_inventory
GROUP BY inventory_status
ORDER BY inventory_count DESC;


/* =================================================================
   📊 PHASE 2 SUMMARY
=================================================================

   👥 PATIENT DEMAND
   UA 01 → Patient Gender Distribution
   UA 02 → Patient Blood Group Distribution
   UA 03 → Admission Type Distribution
   UA 04 → Admission Status Distribution

   🛏️ BED UTILIZATION
   UA 05 → Bed Status Distribution
   UA 06 → Ward Type Distribution
   UA 07 → Length of Stay Distribution

   👨‍⚕️ DEPARTMENT PERFORMANCE
   UA 08 → Department Type Distribution
   UA 09 → Doctor Specialization Distribution
   UA 10 → Employee Role Distribution

   💰 FINANCIAL PERFORMANCE
   UA 11 → Billing Amount Distribution
   UA 12 → Payment Mode Distribution

   🧪 DIAGNOSTIC OPERATIONS
   UA 13 → Diagnostic Result Distribution

   💊 INVENTORY MANAGEMENT
   UA 14 → Drug Category Distribution
   UA 15 → Inventory Status Distribution

   TOTAL = 15 UNIVARIATE ANALYSES

================================================================= */

/* =================================================================
   🏥 HOSPITAL HMIS PROJECT
   PHASE 3 — BIVARIATE ANALYSIS
   SQL SERVER

   END CONSUMER:
   Hospital Management / Administrators

   TOTAL = 15 BIVARIATE ANALYSES
================================================================= */


/* ================================================================
   👥 PATIENT DEMAND
================================================================ */


/* ================================================================
   BA 01 — ADMISSION TYPE vs DEPARTMENT

   Which departments receive the highest number of
   Emergency and Elective admissions?


================================================================ */

Select 
       d.department_name as 'Department_Name',
       a.admission_type as 'Admission_Type',
       count(a.admission_type) as 'Admission_Count'
    From department d Join admission a 
    on d.department_id = a.department_id
    Group by d.department_name, a.admission_type
    Order by d.department_name,Admission_Count Desc
                


/* ================================================================
   BA 02 — GENDER vs ADMISSION TYPE

   Compare patient gender with admission type.

================================================================ */

Select 
        p.patient_id as 'Patient_id',
        p.gender as 'Gender',
        count(a.admission_type) as 'Admission_Count'
    From patient p join admission a
    on p.patient_id = a.patient_id
    Group by  p.patient_id,
              p.gender
    Order by  p.gender,Admission_Count Desc
               
/* ================================================================
   BA 03 — DISEASE CATEGORY vs ADMISSION VOLUME

   Which disease categories generate the highest
   number of admissions?

================================================================ */

Select
       d.disease_category as 'Disease_Category',
       Count(a.admission_type) as 'Admission_Type'
       From disease d join admission a
       on d.disease_id = a.disease_id
    Group by  d.disease_category
    Order by d.disease_category,Admission_Type Desc




/* ================================================================
   🛏️ BED UTILIZATION
================================================================ */


/* ================================================================
   BA 04 — WARD TYPE vs BED OCCUPANCY
  
   Compare ward_type with occupied-bed percentage.

================================================================ */

WITH Bed_Analysis AS
(
    SELECT 
        w.ward_type AS 'Ward_Type',

        COUNT(b.bed_id) AS 'Total_Beds',

        SUM(
            CASE
                WHEN b.bed_status = 'Occupied'
                THEN 1
                ELSE 0
            END
        ) AS 'Occupied_Beds'

    FROM ward  w INNER JOIN bed  b
        ON w.ward_id = b.ward_id

    GROUP BY
        w.ward_type
)

SELECT
    Ward_Type,
    Total_Beds,
    Occupied_Beds,

    (Occupied_Beds * 100.0 / Total_Beds)
        AS 'Occupancy_Percentage'

FROM Bed_Analysis

ORDER BY
    Occupancy_Percentage DESC

/* ================================================================
   BA 05 — DEPARTMENT vs BED CAPACITY

   Compare department with total bed capacity.

================================================================ */

    Select 
           d.department_name as 'Department_Name',
           Count(w.ward_id ) as 'Ward_Count',
           Sum(w.total_beds )as 'Total_Bed_capacity'
        From department d inner join ward w
        on d.department_id = w.department_id
        Group by d.department_name
        Order by  Total_Bed_capacity Desc
                 


/* ================================================================
   BA 06 — WARD TYPE vs STAFF COVERAGE

   Which ward types have the highest number of
   assigned staff members?

================================================================ */

SELECT
    w.ward_type,

    COUNT(DISTINCT sa.employee_id) AS assigned_staff,

    COUNT(DISTINCT w.ward_id) AS ward_count

FROM ward AS w

INNER JOIN staff_assignment AS sa
    ON w.ward_id = sa.ward_id

INNER JOIN employee AS e
    ON sa.employee_id = e.employee_id

GROUP BY
    w.ward_type

ORDER BY
    assigned_staff DESC;

/* ================================================================
   BA 07 — WARD TYPE vs STAFF-TO-BED RATIO
 
   Which ward types have the strongest or weakest
   staff coverage relative to bed capacity?

================================================================ */

SELECT
    w.ward_type,

    COUNT(DISTINCT sa.employee_id) AS staff_count,

    SUM(DISTINCT w.total_beds) AS total_beds,

    ROUND(
        COUNT(DISTINCT sa.employee_id) * 1.0
        /
        NULLIF(SUM(DISTINCT w.total_beds), 0),
        2
    ) AS staff_to_bed_ratio

FROM ward AS w

INNER JOIN staff_assignment AS sa
    ON w.ward_id = sa.ward_id

INNER JOIN employee AS e
    ON sa.employee_id = e.employee_id

GROUP BY
    w.ward_type

ORDER BY
    staff_to_bed_ratio DESC;


/* ================================================================
   👨‍⚕️ DEPARTMENT PERFORMANCE
================================================================ */


/* ================================================================
   BA 08 — DEPARTMENT vs DOCTOR COUNT

   Compare department with doctor workforce.

================================================================ */

SELECT
    d.department_name,
    COUNT(DISTINCT doc.doctor_id) AS doctor_count

FROM department AS d

INNER JOIN employee AS e
    ON d.department_id = e.department_id

INNER JOIN doctor AS doc
    ON e.employee_id = doc.employee_id

GROUP BY
    d.department_name

ORDER BY
    doctor_count DESC;


/* ================================================================
   BA 09 — DOCTOR SPECIALIZATION vs DIAGNOSTIC TEST VOLUME
  
   Compare doctor specialization with diagnostic volume.

================================================================ */

SELECT
    d.specialization,

    COUNT(pd.patient_diagnostic_id) AS diagnostic_count

FROM doctor AS d

INNER JOIN patient_diagnostic AS pd
    ON d.doctor_id = pd.doctor_id

GROUP BY
    d.specialization

ORDER BY
    diagnostic_count DESC;


/* ================================================================
   BA 10 — DEPARTMENT vs REVENUE PER ADMISSION

   Which departments generate the highest revenue
   per patient admission?

   

================================================================ */

SELECT
    d.department_name,

    COUNT(DISTINCT a.admission_id) AS total_admissions,

    ROUND(
        SUM(b.total_amount),
        2
    ) AS total_revenue,

    ROUND(
        SUM(b.total_amount) * 1.0
        /
        NULLIF(COUNT(DISTINCT a.admission_id), 0),
        2
    ) AS revenue_per_admission

FROM department AS d

INNER JOIN admission AS a
    ON d.department_id = a.department_id

INNER JOIN billing AS b
    ON a.admission_id = b.admission_id

GROUP BY
    d.department_name

ORDER BY
    revenue_per_admission DESC;


/* ================================================================
   💰 FINANCIAL PERFORMANCE
================================================================ */


/* ================================================================
   BA 11 — PAYMENT MODE vs REVENUE
   
   Compare payment_mode with total revenue.

   
================================================================ */

SELECT
    b.payment_mode,

    COUNT(DISTINCT a.admission_id) AS admission_count,

    ROUND(
        SUM(b.total_amount),
        2
    ) AS total_revenue

FROM billing AS b

INNER JOIN admission AS a
    ON b.admission_id = a.admission_id

GROUP BY
    b.payment_mode

ORDER BY
    total_revenue DESC;


/* ================================================================
   BA 12 — CHARGE TYPE vs TOTAL CHARGE

   Which type of service contributes the most
   to patient billing?

================================================================ */

SELECT
    bd.charge_type,

    COUNT(bd.billing_detail_id) AS charge_count,

    ROUND(
        SUM(bd.amount),
        2
    ) AS total_charge

FROM billing_detail AS bd

INNER JOIN billing AS b
    ON bd.bill_id = b.bill_id

GROUP BY
    bd.charge_type

ORDER BY
    total_charge DESC;


/* ================================================================
   BA 13 — PAYMENT STATUS vs OUTSTANDING AMOUNT

   Compare payment_status with total
   patient-payable amount.

================================================================ */

SELECT
    b.payment_status,

    COUNT(DISTINCT p.patient_id) AS affected_patients,

    COUNT(DISTINCT b.bill_id) AS bill_count,

    ROUND(
        SUM(b.patient_payable_amount),
        2
    ) AS patient_payable_amount

FROM billing AS b

INNER JOIN admission AS a
    ON b.admission_id = a.admission_id

INNER JOIN patient AS p
    ON a.patient_id = p.patient_id

GROUP BY
    b.payment_status

ORDER BY
    patient_payable_amount DESC;


/* ================================================================
   🧪 DIAGNOSTIC OPERATIONS
================================================================ */


/* ================================================================
   BA 14 — TEST CATEGORY vs ABNORMAL RESULT RATE

   Which diagnostic test categories have
   the highest abnormal-result rate?

================================================================ */

SELECT
    dt.test_category,

    COUNT(pd.patient_diagnostic_id) AS total_tests,

    SUM(
        CASE
            WHEN pd.result_status = 'Abnormal'
            THEN 1
            ELSE 0
        END
    ) AS abnormal_tests,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN pd.result_status = 'Abnormal'
                THEN 1
                ELSE 0
            END
        )
        /
        NULLIF(COUNT(pd.patient_diagnostic_id), 0),
        2
    ) AS abnormal_result_rate

FROM patient_diagnostic AS pd

INNER JOIN diagnostic_test AS dt
    ON pd.test_id = dt.test_id

GROUP BY
    dt.test_category

ORDER BY
    abnormal_result_rate DESC;


/* ================================================================
   💊 INVENTORY MANAGEMENT
================================================================ */


/* ================================================================
   BA 15 — DRUG CATEGORY vs PRESCRIPTION DEMAND


   Compare drug category with prescription demand
   and inventory stock.

   
================================================================ */

WITH DrugDemand AS
(
    SELECT
        d.drug_category,

        COUNT(p.prescription_id) AS prescription_count

    FROM drug AS d

    INNER JOIN prescription AS p
        ON d.drug_id = p.drug_id

    GROUP BY
        d.drug_category
),

DrugStock AS
(
    SELECT
        d.drug_category,

        SUM(di.current_stock) AS total_current_stock

    FROM drug AS d

    INNER JOIN drug_inventory AS di
        ON d.drug_id = di.drug_id

    GROUP BY
        d.drug_category
)

SELECT
    dd.drug_category,

    dd.prescription_count,

    ds.total_current_stock,

    ROUND(
        dd.prescription_count * 1.0
        /
        NULLIF(ds.total_current_stock, 0),
        4
    ) AS demand_to_stock_ratio

FROM DrugDemand AS dd

INNER JOIN DrugStock AS ds
    ON dd.drug_category = ds.drug_category

ORDER BY
    demand_to_stock_ratio DESC;


/* =================================================================
   📊 PHASE 3 — FINAL SUMMARY
=================================================================

   👥 PATIENT DEMAND
   ---------------------------------------------------------------
   BA 01 → Admission Type vs Department              
   BA 02 → Gender vs Admission Type                   
   BA 03 → Disease Category vs Admission Volume      

   🛏️ BED UTILIZATION
   ---------------------------------------------------------------
   BA 04 → Ward Type vs Bed Occupancy                 
   BA 05 → Department vs Bed Capacity                  
   BA 06 → Ward Type vs Staff Coverage                
   BA 07 → Ward Type vs Staff-to-Bed Ratio            

   👨‍⚕️ DEPARTMENT PERFORMANCE
   ---------------------------------------------------------------
   BA 08 → Department vs Doctor Count                 
   BA 09 → Specialization vs Diagnostic Volume        
   BA 10 → Department vs Revenue per Admission       

   💰 FINANCIAL PERFORMANCE
   ---------------------------------------------------------------
   BA 11 → Payment Mode vs Revenue                    
   BA 12 → Charge Type vs Total Charge               
   BA 13 → Payment Status vs Outstanding Amount      

   🧪 DIAGNOSTIC OPERATIONS
   ---------------------------------------------------------------
   BA 14 → Test Category vs Abnormal Result Rate    

   💊 INVENTORY MANAGEMENT
   ---------------------------------------------------------------
   BA 15 → Drug Category vs Demand-to-Stock Ratio    

   TOTAL = 15 BIVARIATE ANALYSES
================================================================= */

/* ============================================================

   HOSPITAL HMIS PROJECT
   PHASE 4 — MULTIVARIATE ANALYSIS
   
   SQL SERVER
   END CONSUMER:Hospital Management / Administrators
   
   TOTAL = 15 MULTIVARIATE ANALYSES
   
   ============================================================ */

/* ============================================================
   MA01
   How does admission volume vary by Department, Admission Type
   and Disease Category?

   ============================================================ */

SELECT
       d.department_name AS 'Department',
       a.admission_type AS 'Admission_Type',
       dis.disease_category AS 'Disease_Category',

       COUNT(a.admission_id) AS 'Total_Admissions'

FROM admission AS a

INNER JOIN department AS d
       ON a.department_id = d.department_id

INNER JOIN disease AS dis
       ON a.disease_id = dis.disease_id

GROUP BY
       d.department_name,
       a.admission_type,
       dis.disease_category

ORDER BY
       Total_Admissions DESC;


/* ============================================================
   MA02

   How are admissions distributed across Gender, Admission Type
   and Department?

   ============================================================ */

SELECT
       p.gender AS 'Gender',
       a.admission_type AS 'Admission_Type',
       d.department_name AS 'Department',

       COUNT(a.admission_id) AS 'Total_Admissions'

FROM admission AS a

INNER JOIN patient AS p
       ON a.patient_id = p.patient_id

INNER JOIN department AS d
       ON a.department_id = d.department_id

GROUP BY
       p.gender,
       a.admission_type,
       d.department_name

ORDER BY
       Total_Admissions DESC;


/* ============================================================
   MA03

   Which Disease Categories generate the highest admissions
   across different Admission Types and Ward Types?

   
   ============================================================ */

SELECT
       dis.disease_category AS 'Disease_Category',
       a.admission_type AS 'Admission_Type',
       w.ward_type AS 'Ward_Type',

       COUNT(a.admission_id) AS 'Total_Admissions'

FROM admission AS a

INNER JOIN disease AS dis
       ON a.disease_id = dis.disease_id

INNER JOIN ward AS w
       ON a.ward_id = w.ward_id

GROUP BY
       dis.disease_category,
       a.admission_type,
       w.ward_type

ORDER BY
       Total_Admissions DESC;


/* ============================================================
   MA04

   What is the bed occupancy across Department, Ward Type
   and Bed Status?

  
   ============================================================ */

SELECT
       d.department_name AS 'Department',
       w.ward_type AS 'Ward_Type',

       COUNT(b.bed_id) AS 'Total_Beds',

       SUM(
            CASE
                WHEN b.bed_status = 'Occupied' THEN 1
                ELSE 0
            END
          ) AS 'Occupied_Beds',

       SUM(
            CASE
                WHEN b.bed_status = 'Available' THEN 1
                ELSE 0
            END
          ) AS 'Available_Beds'

FROM department AS d

INNER JOIN ward AS w
       ON d.department_id = w.department_id

INNER JOIN bed AS b
       ON w.ward_id = b.ward_id

GROUP BY
       d.department_name,
       w.ward_type

ORDER BY
       Occupied_Beds DESC;


/* ============================================================
   MA05

   How does staff coverage vary by Department, Ward Type
   and Shift?

   
   ============================================================ */

SELECT
       d.department_name AS 'Department',
       w.ward_type AS 'Ward_Type',
       sa.shift AS 'Shift',

       COUNT(DISTINCT sa.employee_id) AS 'Staff_Count'

FROM department AS d

INNER JOIN ward AS w
       ON d.department_id = w.department_id

INNER JOIN staff_assignment AS sa
       ON w.ward_id = sa.ward_id

INNER JOIN employee AS e
       ON sa.employee_id = e.employee_id

GROUP BY
       d.department_name,
       w.ward_type,
       sa.shift

ORDER BY
       Staff_Count DESC;


/* ============================================================
   MA06
   
   Which departments have the highest Admissions per Doctor
   based on Department, Doctor Count and Admission Volume?

  
   ============================================================ */

WITH Doctor_Count AS
(
    SELECT
           e.department_id,

           COUNT(DISTINCT doc.doctor_id) AS 'Doctor_Count'

    FROM employee AS e

    INNER JOIN doctor AS doc
           ON e.employee_id = doc.employee_id

    GROUP BY
           e.department_id
),

Admission_Count AS
(
    SELECT
           department_id,

           COUNT(admission_id) AS 'Admission_Count'

    FROM admission

    GROUP BY
           department_id
)

SELECT
       d.department_name AS 'Department',

       dc.Doctor_Count AS 'Doctor_Count',

       ac.Admission_Count AS 'Admission_Count',

       (ac.Admission_Count * 1.0 / dc.Doctor_Count)
           AS 'Admissions_Per_Doctor'

FROM department AS d

INNER JOIN Doctor_Count AS dc
       ON d.department_id = dc.department_id

INNER JOIN Admission_Count AS ac
       ON d.department_id = ac.department_id

ORDER BY
       Admissions_Per_Doctor DESC;


/* ============================================================
   MA07


   Which departments have the highest diagnostic workload
   based on Department, Test Category and Result Status?

  
   ============================================================ */

SELECT
       d.department_name AS 'Department',
       dt.test_category AS 'Test_Category',

       COUNT(pd.patient_diagnostic_id) AS 'Total_Tests',

       SUM(
            CASE
                WHEN pd.result_status = 'Abnormal' THEN 1
                ELSE 0
            END
          ) AS 'Abnormal_Tests'

FROM patient_diagnostic AS pd

INNER JOIN diagnostic_test AS dt
       ON pd.test_id = dt.test_id

INNER JOIN department AS d
       ON dt.department_id = d.department_id

GROUP BY
       d.department_name,
       dt.test_category

ORDER BY
       Total_Tests DESC;


/* ============================================================
   MA08
  
   How does hospital revenue vary by Department and
   Admission Type?

  
   ============================================================ */

SELECT
       d.department_name AS 'Department',
       a.admission_type AS 'Admission_Type',

       COUNT(b.bill_id) AS 'Total_Bills',

       SUM(b.total_amount) AS 'Total_Revenue',

       AVG(b.total_amount) AS 'Average_Bill_Value'

FROM billing AS b

INNER JOIN admission AS a
       ON b.admission_id = a.admission_id

INNER JOIN department AS d
       ON a.department_id = d.department_id

GROUP BY
       d.department_name,
       a.admission_type

ORDER BY
       Total_Revenue DESC;


/* ============================================================
   MA09
  

   Which Department, Payment Mode and Payment Status combinations
   contribute most to revenue and outstanding bills?


   ============================================================ */

SELECT
       d.department_name AS 'Department',
       b.payment_mode AS 'Payment_Mode',
       b.payment_status AS 'Payment_Status',

       COUNT(b.bill_id) AS 'Total_Bills',

       SUM(b.total_amount) AS 'Total_Revenue',

       SUM(
            CASE
                WHEN b.payment_status <> 'Paid'
                THEN b.patient_payable_amount
                ELSE 0
            END
          ) AS 'Outstanding_Amount'

FROM billing AS b

INNER JOIN admission AS a
       ON b.admission_id = a.admission_id

INNER JOIN department AS d
       ON a.department_id = d.department_id

GROUP BY
       d.department_name,
       b.payment_mode,
       b.payment_status

ORDER BY
       Total_Revenue DESC;


/* ============================================================
   MA10
   
   Which Departments generate the highest charges across
   different Charge Types?

 
   ============================================================ */

SELECT
       d.department_name AS 'Department',
       bd.charge_type AS 'Charge_Type',

       COUNT(bd.billing_detail_id) AS 'Total_Charges',

       SUM(bd.amount) AS 'Total_Charge_Amount',

       AVG(bd.amount) AS 'Average_Charge'

FROM billing_detail AS bd

INNER JOIN billing AS b
       ON bd.bill_id = b.bill_id

INNER JOIN admission AS a
       ON b.admission_id = a.admission_id

INNER JOIN department AS d
       ON a.department_id = d.department_id

GROUP BY
       d.department_name,
       bd.charge_type

ORDER BY
       Total_Charge_Amount DESC;


/* ============================================================
   MA11
 
   Which Department and Test Category have the highest
   Abnormal Diagnostic Test Rate?

 
   ============================================================ */

WITH Diagnostic_Analysis AS
(
    SELECT
           d.department_name AS 'Department',
           dt.test_category AS 'Test_Category',

           COUNT(pd.patient_diagnostic_id) AS 'Total_Tests',

           SUM(
                CASE
                    WHEN pd.result_status = 'Abnormal' THEN 1
                    ELSE 0
                END
              ) AS 'Abnormal_Tests'

    FROM patient_diagnostic AS pd

    INNER JOIN diagnostic_test AS dt
           ON pd.test_id = dt.test_id

    INNER JOIN department AS d
           ON dt.department_id = d.department_id

    GROUP BY
           d.department_name,
           dt.test_category
)

SELECT
       Department,
       Test_Category,
       Total_Tests,
       Abnormal_Tests,

       (Abnormal_Tests * 100.0 / Total_Tests)
           AS 'Abnormal_Test_Rate'

FROM Diagnostic_Analysis

ORDER BY
       Abnormal_Test_Rate DESC;


/* ============================================================
   MA12
   
   How does diagnostic workload and abnormal-result volume vary
   by Doctor Specialization and Test Category?

  
   ============================================================ */

SELECT
       doc.specialization AS 'Specialization',
       dt.test_category AS 'Test_Category',

       COUNT(pd.patient_diagnostic_id) AS 'Total_Tests',

       SUM(
            CASE
                WHEN pd.result_status = 'Abnormal' THEN 1
                ELSE 0
            END
          ) AS 'Abnormal_Tests'

FROM patient_diagnostic AS pd

INNER JOIN doctor AS doc
       ON pd.doctor_id = doc.doctor_id

INNER JOIN diagnostic_test AS dt
       ON pd.test_id = dt.test_id

GROUP BY
       doc.specialization,
       dt.test_category

ORDER BY
       Total_Tests DESC;


/* ============================================================
   MA13
  
   Which Drug Categories have high Prescription Demand
   and Low Inventory?

  
   ============================================================ */

WITH Prescription_Demand AS
(
    SELECT
           dr.drug_id,
           dr.drug_category,

           COUNT(p.prescription_id) AS 'Prescription_Count'

    FROM drug AS dr

    INNER JOIN prescription AS p
           ON dr.drug_id = p.drug_id

    GROUP BY
           dr.drug_id,
           dr.drug_category
),

Inventory_Data AS
(
    SELECT
           drug_id,

           current_stock,
           reorder_level,
           inventory_status

    FROM drug_inventory
)

SELECT
       pd.drug_category AS 'Drug_Category',
       i.inventory_status AS 'Inventory_Status',

       COUNT(pd.drug_id) AS 'Total_Drugs',

       SUM(pd.Prescription_Count) AS 'Total_Prescriptions',

       SUM(i.current_stock) AS 'Current_Stock',

       SUM(i.reorder_level) AS 'Reorder_Level'

FROM Prescription_Demand AS pd

INNER JOIN Inventory_Data AS i
       ON pd.drug_id = i.drug_id

GROUP BY
       pd.drug_category,
       i.inventory_status

ORDER BY
       Total_Prescriptions DESC;


/* ============================================================
   MA14


   How does drug inventory status vary across Drug Category
   and Manufacturer Country?

 
   ============================================================ */

SELECT
       dr.drug_category AS 'Drug_Category',
       dm.country AS 'Manufacturer_Country',
       di.inventory_status AS 'Inventory_Status',

       COUNT(dr.drug_id) AS 'Total_Drugs',

       AVG(dr.unit_cost) AS 'Average_Unit_Cost',

       SUM(di.current_stock) AS 'Current_Stock'

FROM drug AS dr

JOIN drug_manufacturer AS dm
       ON dr.manufacturer_id = dm.manufacturer_id

 JOIN drug_inventory AS di
       ON dr.drug_id = di.drug_id

GROUP BY
       dr.drug_category,
       dm.country,
       di.inventory_status

ORDER BY
       Total_Drugs DESC;


/* ============================================================
   MA15

   Which Departments generate the highest combination of
   Admissions, Revenue and Diagnostic Test Volume?

  
   ============================================================ */

WITH Admission_Data AS
(
    SELECT
           department_id,

           COUNT(admission_id) AS 'Total_Admissions'

    FROM admission

    GROUP BY
           department_id
),

Revenue_Data AS
(
    SELECT
           a.department_id,

           SUM(b.total_amount) AS 'Total_Revenue'

    FROM billing AS b

    INNER JOIN admission AS a
           ON b.admission_id = a.admission_id

    GROUP BY
           a.department_id
),

Diagnostic_Data AS
(
    SELECT
           d.department_id,

           COUNT(pd.patient_diagnostic_id) AS 'Total_Diagnostic_Tests'

    FROM patient_diagnostic AS pd

    INNER JOIN diagnostic_test AS dt
           ON pd.test_id = dt.test_id

    INNER JOIN department AS d
           ON dt.department_id = d.department_id

    GROUP BY
           d.department_id
)

SELECT
       d.department_name AS 'Department',

       ad.Total_Admissions AS 'Total_Admissions',

       rd.Total_Revenue AS 'Total_Revenue',

       dd.Total_Diagnostic_Tests AS 'Total_Diagnostic_Tests',

       (rd.Total_Revenue * 1.0 / ad.Total_Admissions)
           AS 'Revenue_Per_Admission',

       (dd.Total_Diagnostic_Tests * 1.0 / ad.Total_Admissions)
           AS 'Tests_Per_Admission'

FROM department AS d

INNER JOIN Admission_Data AS ad
       ON d.department_id = ad.department_id

INNER JOIN Revenue_Data AS rd
       ON d.department_id = rd.department_id

INNER JOIN Diagnostic_Data AS dd
       ON d.department_id = dd.department_id

ORDER BY
       Total_Revenue DESC;
/* =================================================================
   📊 PHASE 4 — FINAL SUMMARY
================================================================= */

/*   👥 PATIENT DEMAND
   ---------------------------------------------------------------
   MA 01 → Department vs Admission Type vs Disease Category
   MA 02 → Gender vs Admission Type vs Department
   MA 03 → Disease Category vs Admission Type vs Ward Type


   🛏️ BED UTILIZATION
   ---------------------------------------------------------------
   MA 04 → Department vs Ward Type vs Bed Status
   MA 05 → Department vs Ward Type vs Shift
   MA 06 → Department vs Doctor Count vs Admission Volume


   👨‍⚕️ DEPARTMENT PERFORMANCE
   ---------------------------------------------------------------
   MA 07 → Department vs Test Category vs Diagnostic Results
   MA 08 → Department vs Admission Type vs Revenue


   💰 FINANCIAL PERFORMANCE
   ---------------------------------------------------------------
   MA 09 → Department vs Payment Mode vs Payment Status
   MA 10 → Department vs Charge Type vs Total Charge
   MA 11 → Department vs Test Category vs Abnormal Result Rate


   🧪 DIAGNOSTIC OPERATIONS
   ---------------------------------------------------------------
   MA 12 → Doctor Specialization vs Test Category vs Results


   💊 INVENTORY MANAGEMENT
   ---------------------------------------------------------------
   MA 13 → Drug Category vs Inventory Status vs Prescription Demand
   MA 14 → Drug Category vs Manufacturer Country vs Inventory Status


   🔗 INTEGRATED HOSPITAL PERFORMANCE
   ---------------------------------------------------------------
   MA 15 → Department vs Admissions vs Revenue vs Diagnostic Volume


   TOTAL = 15 MULTIVARIATE ANALYSES
================================================================= */