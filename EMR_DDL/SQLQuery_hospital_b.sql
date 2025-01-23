


drop TABLE if EXISTS   departments;
create table  departments
(
 DeptID  NVARCHAR(12),
 Name  NVARCHAR(40) 

)

SELECT * FROM HOSPITAL_A.DBo.departments;

drop TABLE if EXISTS dbo.Encounters;
CREATE TABLE Encounters (
    EncounterID NVARCHAR(50),           -- Unique identifier for the encounter
    PatientID NVARCHAR(50),             -- Unique identifier for the patient
    EncounterDate NVARCHAR(50),                 -- Date of the encounter
    EncounterType NVARCHAR(50),         -- Type of the encounter (e.g., Inpatient, Outpatient)
    ProviderID NVARCHAR(50),            -- Unique identifier for the provider
    DepartmentID NVARCHAR(50),          -- Unique identifier for the department
    ProcedureCode NVARCHAR(50),         -- Code for the procedure performed
    InsertedDate NVARCHAR(50),                  -- Date the record was inserted
    ModifiedDate NVARCHAR(50)                -- Date the record was last modified
);

drop TABLE if EXISTS dbo.patients;
CREATE TABLE Patients (
    PatientID NVARCHAR(50),           -- Unique identifier for the patient
    FirstName NVARCHAR(50),           -- First name of the patient
    LastName NVARCHAR(50),            -- Last name of the patient
    MiddleName NVARCHAR(50),          -- Middle name of the patient
    SSN NVARCHAR(15),                 -- Social Security Number of the patient
    PhoneNumber NVARCHAR(50),         -- Contact number of the patient
    Gender NVARCHAR(10),              -- Gender of the patient
    DOB NVARCHAR(50),                         -- Date of Birth of the patient
    Address NVARCHAR(100),            -- Address of the patient
    ModifiedDate NVARCHAR(20)                -- Last modification date for the record
);


-- SELECT count(*) FROM Patients; 5000
-- SELECT count(*) FROM  encounters;10000
-- -- SELECT count(*) FROM providers;25
-- SELECT count(*) FROM transactions;10000
-- SELECT count(*) FROM departments; 20






drop TABLE if EXISTS dbo.providers;
create table providers
(
ProviderID NVARCHAR(30),
FirstName NVARCHAR(30) ,
LastName NVARCHAR(30),
Specialization NVARCHAR(20),
DeptID NVARCHAR(20),
NPI NVARCHAR(15)
)

drop TABLE if EXISTS dbo.Transactions;
CREATE TABLE Transactions (
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

SELECT * FROM DBO.departments;


 
select HOSPITAL_A.dbo.departments;




-- ALTER DATABASE dbo MODIFY NAME = hospital_a;
-- GO

----------------------------------TRANSACTION-------------------------

--alter the column 
--. Ensure TransactionID Column is Not Nullable
ALTER TABLE hospital_a.dbo.transactions
alter COLUMN TransactionID NVARCHAR(50) not null;

select TransactionID , count(*)
from hospital_a.dbo.transactions
group by TransactionID
having count(*)>1


ALTER TABLE HOSPITAL_A.dbo.transactions
ADD CONSTRAINT PK_TransactionID PRIMARY KEY (TransactionID);

alter table HOSPITAL_A.dbo.transactions
add PRIMARY key(TransactionID);

--alter a cloumn and chnage its datatype 

alter table HOSPITAL_A.dbo.transactions
alter COLUMN  visitDate date 

alter table HOSPITAL_A.dbo.transactions
 alter COLUMN  ServiceDate date  
 
 alter table HOSPITAL_A.dbo.transactions
 alter COLUMN  PaidDate date  
 
 alter table HOSPITAL_A.dbo.transactions
 alter COLUMN  InsertDate date  
 
 alter table HOSPITAL_A.dbo.transactions
 alter COLUMN  ModifiedDate date 


----------------------------provider-------------------------------------
select top 10 * from dbo.Transactions;

   CONSTRAINT PK_providers PRIMARY KEY (ProviderID)

alter table dbo.providers
alter column ProviderID VARCHAR(15) not null;

alter table dbo.providers
add CONSTRAINT PK_providers PRIMARY KEY (ProviderID)



------------------patient----------------------------------
select top 10 * from dbo.patients;
 CONSTRAINT PK_hospital1_patient_data PRIMARY KEY (PatientID)


alter table dbo.patients
alter column PATIENTID VARCHAR(20) not NULL


alter table dbo.patients
alter column dob date not NULL

alter table dbo.patients
alter column ModifiedDate date not NULL

alter table dbo.patients
add  CONSTRAINT PK_hospital1_patient_data PRIMARY KEY (PATIENTID)

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
