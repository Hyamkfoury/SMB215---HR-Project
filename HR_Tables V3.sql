
CREATE TABLE HR.COUNTRIES 
(
  COUNTRY_ID CHAR(2 BYTE) NOT NULL 
, COUNTRY_NAME VARCHAR2(40 BYTE) 
, REGION_ID NUMBER 
, CONSTRAINT COUNTRY_C_ID_PK PRIMARY KEY 
  (
    COUNTRY_ID 
  )
  ENABLE 
) 

CREATE TABLE HR.DEPARTMENTS 
(
  DEPARTMENT_ID NUMBER(4, 0) NOT NULL 
, DEPARTMENT_NAME VARCHAR2(30 BYTE) NOT NULL 
, MANAGER_ID NUMBER(6, 0) 
, LOCATION_ID NUMBER(4, 0) 
);

CREATE TABLE HR.EMPLOYEES 
(
  EMPLOYEE_ID NUMBER(6, 0) NOT NULL 
, FIRST_NAME VARCHAR2(20 BYTE) 
, LAST_NAME VARCHAR2(25 BYTE) NOT NULL 
, EMAIL VARCHAR2(25 BYTE) NOT NULL 
, PHONE_NUMBER VARCHAR2(20 BYTE) 
, HIRE_DATE DATE NOT NULL 
, JOB_ID VARCHAR2(10 BYTE) NOT NULL 
, SALARY NUMBER(8, 2) 
, COMMISSION_PCT NUMBER(2, 2) 
, MANAGER_ID NUMBER(6, 0) 
, DEPARTMENT_ID NUMBER(4, 0) 
);

CREATE TABLE HR.JOBS 
(
  JOB_ID VARCHAR2(10 BYTE) NOT NULL 
, JOB_TITLE VARCHAR2(35 BYTE) NOT NULL 
, MIN_SALARY NUMBER(6, 0) 
, MAX_SALARY NUMBER(6, 0) 
);

CREATE TABLE HR.JOB_HISTORY 
(
  EMPLOYEE_ID NUMBER(6, 0) NOT NULL 
, START_DATE DATE NOT NULL 
, END_DATE DATE NOT NULL 
, JOB_ID VARCHAR2(10 BYTE) NOT NULL 
, DEPARTMENT_ID NUMBER(4, 0) 
);

CREATE TABLE HR.LOCATIONS 
(
  LOCATION_ID NUMBER(4, 0) NOT NULL 
, STREET_ADDRESS VARCHAR2(40 BYTE) 
, POSTAL_CODE VARCHAR2(12 BYTE) 
, CITY VARCHAR2(30 BYTE) NOT NULL 
, STATE_PROVINCE VARCHAR2(25 BYTE) 
, COUNTRY_ID CHAR(2 BYTE) 
);

CREATE TABLE HR.REGIONS 
(
  REGION_ID NUMBER NOT NULL 
, REGION_NAME VARCHAR2(25 BYTE) 
);

CREATE UNIQUE INDEX HR.DEPT_ID_PK ON HR.DEPARTMENTS (DEPARTMENT_ID ASC);

CREATE INDEX HR.DEPT_LOCATION_IX ON HR.DEPARTMENTS (LOCATION_ID ASC);

CREATE INDEX HR.EMP_DEPARTMENT_IX ON HR.EMPLOYEES (DEPARTMENT_ID ASC);

CREATE UNIQUE INDEX HR.EMP_EMP_ID_PK ON HR.EMPLOYEES (EMPLOYEE_ID ASC);

CREATE INDEX HR.EMP_JOB_IX ON HR.EMPLOYEES (JOB_ID ASC);

CREATE INDEX HR.EMP_MANAGER_IX ON HR.EMPLOYEES (MANAGER_ID ASC);

CREATE INDEX HR.EMP_NAME_IX ON HR.EMPLOYEES (LAST_NAME ASC, FIRST_NAME ASC);

CREATE UNIQUE INDEX HR.JOB_ID_PK ON HR.JOBS (JOB_ID ASC);

CREATE INDEX HR.JHIST_DEPARTMENT_IX ON HR.JOB_HISTORY (DEPARTMENT_ID ASC);

CREATE INDEX HR.JHIST_EMPLOYEE_IX ON HR.JOB_HISTORY (EMPLOYEE_ID ASC);

CREATE UNIQUE INDEX HR.JHIST_EMP_ID_ST_DATE_PK ON HR.JOB_HISTORY (EMPLOYEE_ID ASC, START_DATE ASC);

CREATE INDEX HR.JHIST_JOB_IX ON HR.JOB_HISTORY (JOB_ID ASC);

CREATE INDEX HR.LOC_CITY_IX ON HR.LOCATIONS (CITY ASC);

CREATE INDEX HR.LOC_COUNTRY_IX ON HR.LOCATIONS (COUNTRY_ID ASC);

CREATE UNIQUE INDEX HR.LOC_ID_PK ON HR.LOCATIONS (LOCATION_ID ASC);

CREATE INDEX HR.LOC_STATE_PROVINCE_IX ON HR.LOCATIONS (STATE_PROVINCE ASC);

CREATE UNIQUE INDEX HR.REG_ID_PK ON HR.REGIONS (REGION_ID ASC);

ALTER TABLE HR.DEPARTMENTS
ADD CONSTRAINT DEPT_ID_PK PRIMARY KEY 
(
  DEPARTMENT_ID 
)
USING INDEX DEPT_ID_PK
ENABLE;

ALTER TABLE HR.EMPLOYEES
ADD CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY 
(
  EMPLOYEE_ID 
)
USING INDEX EMP_EMP_ID_PK
ENABLE;

ALTER TABLE HR.JOBS
ADD CONSTRAINT JOB_ID_PK PRIMARY KEY 
(
  JOB_ID 
)
USING INDEX JOB_ID_PK
ENABLE;

ALTER TABLE HR.JOB_HISTORY
ADD CONSTRAINT JHIST_EMP_ID_ST_DATE_PK PRIMARY KEY 
(
  EMPLOYEE_ID 
, START_DATE 
)
USING INDEX JHIST_EMP_ID_ST_DATE_PK
ENABLE;

ALTER TABLE HR.LOCATIONS
ADD CONSTRAINT LOC_ID_PK PRIMARY KEY 
(
  LOCATION_ID 
)
USING INDEX LOC_ID_PK
ENABLE;

ALTER TABLE HR.REGIONS
ADD CONSTRAINT REG_ID_PK PRIMARY KEY 
(
  REGION_ID 
)
USING INDEX REG_ID_PK
ENABLE;
