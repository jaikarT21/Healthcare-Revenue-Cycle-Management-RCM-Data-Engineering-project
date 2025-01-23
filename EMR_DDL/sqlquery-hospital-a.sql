use hospital_b;


drop TABLE if EXISTS   dbo.departments;
create table  hospital_b.dbo.departments
(
 DeptID  NVARCHAR(12),
 Name  NVARCHAR(40) 

)

drop TABLE if EXISTS dbo.Encounters
go
CREATE TABLE  hospital_b.dbo.Encounters (
    EncounterID NVARCHAR(50),           -- Unique identifier for the encounter
    PatientID NVARCHAR(50),             -- Unique identifier for the patient
    EncounterDate NVARCHAR(50),                 -- Date of the encounter
    EncounterType NVARCHAR(50),         -- Type of the encounter (e.g., Inpatient, Outpatient)
    ProviderID NVARCHAR(50),            -- Unique identifier for the provider
    DepartmentID NVARCHAR(50),          -- Unique identifier for the department
    ProcedureCode NVARCHAR(50),         -- Code for the procedure performed
    InsertedDate NVARCHAR(50),                  -- Date the record was inserted
    ModifiedDate NVARCHAR(50)                -- Date the record was last modified
)
go

drop TABLE if EXISTS dbo.patients;
CREATE TABLE hospital_b.dbo.Patients (
    ID NVARCHAR(50),           -- Unique identifier for the patient
    F_Name NVARCHAR(50),           -- First name of the patient
    L_Name NVARCHAR(50),            -- Last name of the patient
    M_Name NVARCHAR(50),          -- Middle name of the patient
    SSN NVARCHAR(15),                 -- Social Security Number of the patient
    PhoneNumber NVARCHAR(50),         -- Contact number of the patient
    Gender NVARCHAR(10),              -- Gender of the patient
    DOB NVARCHAR(50),                         -- Date of Birth of the patient
    Address NVARCHAR(100),            -- Address of the patient
    Updated_Date NVARCHAR(20)                -- Last modification date for the record
);

drop TABLE if EXISTS dbo.providers;
create table hospital_b.dbo.providers
(
ProviderID NVARCHAR(30),
FirstName NVARCHAR(30) ,
LastName NVARCHAR(30),
Specialization NVARCHAR(20),
DeptID NVARCHAR(20),
NPI NVARCHAR(15)
);

drop TABLE if EXISTS dbo.Transactions;
CREATE TABLE hospital_b.dbo.Transactions (
    TransactionID NVARCHAR(50),           -- Unique identifier for the transaction
    EncounterID NVARCHAR(50),             -- Reference to the encounter
    PatientID NVARCHAR(50),               -- Reference to the patient
    ProviderID NVARCHAR(50),              -- Reference to the provider
    DeptID NVARCHAR(50),                  -- Reference to the department
    VisitDate NVARCHAR (15),                       -- Date of the visit
    ServiceDate NVARCHAR  (15),                     -- Date the service was provided
    PaidDate NVARCHAR  (15),                        -- Date the payment was made
    VisitType NVARCHAR(50),               -- Type of visit (e.g., Routine)
    Amount FLOAT,                         -- Total amount billed
    AmountType NVARCHAR(50),              -- Type of amount (e.g., Medicare)
    PaidAmount FLOAT,                     -- Amount paid
    ClaimID NVARCHAR(50),                 -- Claim identifier
    PayorID NVARCHAR(50),                 -- Identifier for the payor
    ProcedureCode NVARCHAR(20),           -- Procedure code
    ICDCode NVARCHAR(10),                 -- ICD code for diagnosis
    LineOfBusiness NVARCHAR(50),          -- Line of business (e.g., Commercial)
    MedicaidID NVARCHAR(50),              -- Medicaid identifier
    MedicareID NVARCHAR(50),              -- Medicare identifier
    InsertDate NVARCHAR (15),                      -- Date the record was inserted
    ModifiedDate NVARCHAR (15)                    -- Date the record was last modified
);

SELECT * FROM hospital_b.dbo.Transactions;
select top 10 * from hospital_b.dbo.departments;
select top 10 * from dbo.encounters;

select top 10 * from dbo.providers;
select top 10 * from dbo.transactions;
SELECT top 10 * from dbo.patients;


-----------------------------transaction----------------------------------------
--alter the column 
--. Ensure TransactionID Column is Not Nullable
ALTER TABLE hospital_b.dbo.transactions
alter COLUMN TransactionID NVARCHAR(50) not null;


-- CONSTRAINT PK_transactions PRIMARY KEY (TransactionID)
--Ensure the column contains unique, non-NULL values

select TransactionID , count(*)
from hospital_b.dbo.transactions
group by TransactionID
having count(*)>1


ALTER TABLE hospital_b.dbo.transactions
ADD CONSTRAINT PK_TransactionID PRIMARY KEY (TransactionID);

alter table hospital_b.dbo.transactions
add PRIMARY key(TransactionID);

--alter a cloumn and chnage its datatype 

alter table hospital_b.dbo.transactions
alter COLUMN  visitDate date 

alter table hospital_b.dbo.transactions
 alter COLUMN  ServiceDate date  
 
 alter table hospital_b.dbo.transactions
 alter COLUMN  PaidDate date  
 
 alter table hospital_b.dbo.transactions
 alter COLUMN  InsertDate date  
 
 alter table hospital_b.dbo.transactions
 alter COLUMN  ModifiedDate date 


----------------------------provider-------------------------------------
select top 10 * from dbo.providers;

   CONSTRAINT PK_providers PRIMARY KEY (ProviderID)

alter table dbo.providers
alter column ProviderID VARCHAR(15) not null;

alter table dbo.providers
add CONSTRAINT PK_providers PRIMARY KEY (ProviderID)



------------------patient----------------------------------
select top 10 * from dbo.patients;
 CONSTRAINT PK_hospital1_patient_data PRIMARY KEY (PatientID)


alter table dbo.patients
alter column ID VARCHAR(20) not NULL


alter table dbo.patients
alter column dob date not NULL

alter table dbo.patients
alter column Updated_Date date not NULL

alter table dbo.patients
add  CONSTRAINT PK_hospital1_patient_data PRIMARY KEY (ID)

-----------------encounter ---------------------------------



alter table dbo.encounters
alter column EncounterID VARCHAR(20) NOT NULL ;


alter table dbo.encounters
ADD CONSTRAINT PK_encounters PRIMARY KEY (EncounterID)

    
alter table dbo.encounters
alter column  InsertedDate date NOT NULL

    
alter table dbo.encounters
alter column  ModifiedDate date NOT NULL
    
alter table dbo.encounters
alter column  EncounterDate date NOT NULL
