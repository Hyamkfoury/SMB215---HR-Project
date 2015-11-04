create database hr;
commit;
use hr;

CREATE TABLE COUNTRIES 
(
  COUNTRY_ID CHAR(2) NOT NULL 
, COUNTRY_NAME VARCHAR(40) 
, REGION_ID int
, PRIMARY KEY (COUNTRY_ID )
  
) 
;


CREATE TABLE DEPARTMENTS 
(
  DEPARTMENT_ID INT(4) NOT NULL 
, DEPARTMENT_NAME VARCHAR(30 ) NOT NULL 
, MANAGER_ID INT(6) 
, LOCATION_ID INT(4) 
, PRIMARY KEY ( DEPARTMENT_ID) 
  )
;

CREATE TABLE EMPLOYEES 
(
  EMPLOYEE_ID INT(6) NOT NULL AUTO_INCREMENT 
, FIRST_NAME VARCHAR(20 ) 
, LAST_NAME VARCHAR(25 ) NOT NULL 
, EMAIL VARCHAR(25 ) NOT NULL 
, PHONE_NUMBER VARCHAR(20 ) 
, HIRE_DATE DATE NOT NULL 
, JOB_ID VARCHAR(10 ) NOT NULL 
, SALARY INT(8) 
, COMMISSION_PCT INT(2) 
, MANAGER_ID INT(6) 
, DEPARTMENT_ID INT(4) 
, PASSWORD VARCHAR(30 ) 
, PRIMARY KEY 
  (
    EMPLOYEE_ID 
  )
   
) 
;

CREATE TABLE JOBS 
(
  JOB_ID VARCHAR(10 ) NOT NULL 
, JOB_TITLE VARCHAR(35 ) NOT NULL 
, MIN_SALARY INT(6) 
, MAX_SALARY INT(6) 
, PRIMARY KEY 
  (
    JOB_ID 
  )
   
) 

;

CREATE TABLE JOB_HISTORY 
(
  EMPLOYEE_ID INT(6) NOT NULL 
, START_DATE DATE NOT NULL 
, END_DATE DATE NOT NULL 
, JOB_ID VARCHAR(10 ) NOT NULL 
, DEPARTMENT_ID INT(4) 
) 

;

CREATE TABLE LOCATIONS 
(
  LOCATION_ID INT(4) NOT NULL 
, STREET_ADDRESS VARCHAR(40 ) 
, POSTAL_CODE VARCHAR(12 ) 
, CITY VARCHAR(30 ) NOT NULL 
, STATE_PROVINCE VARCHAR(25 ) 
, COUNTRY_ID CHAR(2 ) 
, PRIMARY KEY 
  (
    LOCATION_ID 
  )
   
) 
;

CREATE TABLE REGIONS 
(
  REGION_ID INT NOT NULL 
, REGION_NAME VARCHAR(25 ) 
, PRIMARY KEY 
  (
    REGION_ID 
  )
  
) 
;

CREATE TABLE REQUESTS 
(
  FROMDATE DATE 
, TODATE DATE 
, NOTE VARCHAR(400 ) 
, STATUS VARCHAR(100 ) 
, TYPE VARCHAR(20 ) 
, EMPID INT(10) 
, REQ_ID INT(10) NOT NULL 
) 
;

CREATE VIEW EMP_DETAILS_VIEW AS SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id;

COMMIT;

CREATE INDEX DEPT_LOCATION_IX ON DEPARTMENTS (LOCATION_ID ASC) 
;

CREATE INDEX EMP_DEPARTMENT_IX ON EMPLOYEES (DEPARTMENT_ID ASC) 
;

CREATE INDEX EMP_JOB_IX ON EMPLOYEES (JOB_ID ASC) 
;

CREATE INDEX EMP_MANAGER_IX ON EMPLOYEES (MANAGER_ID ASC) 
;

CREATE INDEX EMP_NAME_IX ON EMPLOYEES (LAST_NAME ASC, FIRST_NAME ASC) 
;

CREATE INDEX JHIST_DEPARTMENT_IX ON JOB_HISTORY (DEPARTMENT_ID ASC) 
;

CREATE INDEX JHIST_EMPLOYEE_IX ON JOB_HISTORY (EMPLOYEE_ID ASC) 
;

CREATE UNIQUE INDEX JHIST_EMP_ID_ST_DATE_PK ON JOB_HISTORY (EMPLOYEE_ID ASC, START_DATE ASC) 
;

CREATE INDEX JHIST_JOB_IX ON JOB_HISTORY (JOB_ID ASC) 
;

CREATE INDEX LOC_CITY_IX ON LOCATIONS (CITY ASC) 
;

CREATE INDEX LOC_COUNTRY_IX ON LOCATIONS (COUNTRY_ID ASC) 
;

CREATE INDEX LOC_STATE_PROVINCE_IX ON LOCATIONS (STATE_PROVINCE ASC) 
;

CREATE UNIQUE INDEX PRIMKEY ON REQUESTS (REQ_ID ASC) 
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_EMP_ID_ST_DATE_PK PRIMARY KEY 
(
  EMPLOYEE_ID 
, START_DATE 
)
;

ALTER TABLE REQUESTS
ADD CONSTRAINT PRIMKEY PRIMARY KEY 
(
  REQ_ID 
)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_EMAIL_UK UNIQUE 
(
  EMAIL 
)
 ;

ALTER TABLE COUNTRIES
ADD CONSTRAINT COUNTR_REG_FK FOREIGN KEY
(
  REGION_ID 
)
REFERENCES REGIONS
(
  REGION_ID 
)
;

ALTER TABLE DEPARTMENTS
ADD CONSTRAINT DEPT_LOC_FK FOREIGN KEY
(
  LOCATION_ID 
)
REFERENCES LOCATIONS
(
  LOCATION_ID 
)
;

ALTER TABLE DEPARTMENTS
ADD CONSTRAINT DEPT_MGR_FK FOREIGN KEY
(
  MANAGER_ID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_DEPT_FK FOREIGN KEY
(
  DEPARTMENT_ID 
)
REFERENCES DEPARTMENTS
(
  DEPARTMENT_ID 
)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_JOB_FK FOREIGN KEY
(
  JOB_ID 
)
REFERENCES JOBS
(
  JOB_ID 
)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_MANAGER_FK FOREIGN KEY
(
  MANAGER_ID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_DEPT_FK FOREIGN KEY
(
  DEPARTMENT_ID 
)
REFERENCES DEPARTMENTS
(
  DEPARTMENT_ID 
)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_EMP_FK FOREIGN KEY
(
  EMPLOYEE_ID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_JOB_FK FOREIGN KEY
(
  JOB_ID 
)
REFERENCES JOBS
(
  JOB_ID 
)
;

ALTER TABLE LOCATIONS
ADD CONSTRAINT LOC_C_ID_FK FOREIGN KEY
(
  COUNTRY_ID 
)
REFERENCES COUNTRIES
(
  COUNTRY_ID 
)
;

ALTER TABLE REQUESTS
ADD CONSTRAINT EMP_ID_FK FOREIGN KEY
(
  EMPID 
)
REFERENCES EMPLOYEES
(
  EMPLOYEE_ID 
)
;

ALTER TABLE COUNTRIES
ADD CONSTRAINT COUNTRY_ID_NN CHECK 
(COUNTRY_ID IS NOT NULL)
;

ALTER TABLE DEPARTMENTS
ADD CONSTRAINT DEPT_NAME_NN CHECK 
(DEPARTMENT_NAME IS NOT NULL)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_EMAIL_NN CHECK 
(EMAIL  IS NOT NULL)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_HIRE_DATE_NN CHECK 
(HIRE_DATE  IS NOT NULL)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_JOB_NN CHECK 
(JOB_ID  IS NOT NULL)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_LAST_NAME_NN CHECK 
(LAST_NAME  IS NOT NULL)
;

ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_SALARY_MIN CHECK 
(SALARY > 0)
;

ALTER TABLE JOBS
ADD CONSTRAINT JOB_TITLE_NN CHECK 
(JOB_TITLE IS NOT NULL)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_DATE_INTERVAL CHECK 
(END_DATE > START_DATE)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_EMPLOYEE_NN CHECK 
(EMPLOYEE_ID  IS NOT NULL)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_END_DATE_NN CHECK 
(END_DATE  IS NOT NULL)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_JOB_NN CHECK 
(JOB_ID  IS NOT NULL)
;

ALTER TABLE JOB_HISTORY
ADD CONSTRAINT JHIST_START_DATE_NN CHECK 
(START_DATE  IS NOT NULL)
;

ALTER TABLE LOCATIONS
ADD CONSTRAINT LOC_CITY_NN CHECK 
(CITY  IS NOT NULL)
;

ALTER TABLE REGIONS
ADD CONSTRAINT REGION_ID_NN CHECK 
(REGION_ID  IS NOT NULL)
;



ALTER TABLE EMPLOYEES AUTO_INCREMENT=100;

INSERT INTO regions
VALUES (
	1,
	'Europe'
	);

INSERT INTO regions
VALUES (
	2,
	'Americas'
	);

INSERT INTO regions
VALUES (
	3,
	'Asia'
	);

INSERT INTO regions
VALUES (
	4,
	'Middle East and Africa'
	);

COMMIT;

INSERT INTO countries
VALUES (
	'IT',
	'Italy',
	1
	);

INSERT INTO countries
VALUES (
	'JP',
	'Japan',
	3
	);

INSERT INTO countries
VALUES (
	'US',
	'United States of America',
	2
	);

INSERT INTO countries
VALUES (
	'CA',
	'Canada',
	2
	);

INSERT INTO countries
VALUES (
	'CN',
	'China',
	3
	);

INSERT INTO countries
VALUES (
	'IN',
	'India',
	3
	);

INSERT INTO countries
VALUES (
	'AU',
	'Australia',
	3
	);

INSERT INTO countries
VALUES (
	'ZW',
	'Zimbabwe',
	4
	);

INSERT INTO countries
VALUES (
	'SG',
	'Singapore',
	3
	);

INSERT INTO countries
VALUES (
	'UK',
	'United Kingdom',
	1
	);

INSERT INTO countries
VALUES (
	'FR',
	'France',
	1
	);

INSERT INTO countries
VALUES (
	'DE',
	'Germany',
	1
	);

INSERT INTO countries
VALUES (
	'ZM',
	'Zambia',
	4
	);

INSERT INTO countries
VALUES (
	'EG',
	'Egypt',
	4
	);

INSERT INTO countries
VALUES (
	'BR',
	'Brazil',
	2
	);

INSERT INTO countries
VALUES (
	'CH',
	'Switzerland',
	1
	);

INSERT INTO countries
VALUES (
	'NL',
	'Netherlands',
	1
	);

INSERT INTO countries
VALUES (
	'MX',
	'Mexico',
	2
	);

INSERT INTO countries
VALUES (
	'KW',
	'Kuwait',
	4
	);

INSERT INTO countries
VALUES (
	'IL',
	'Israel',
	4
	);

INSERT INTO countries
VALUES (
	'DK',
	'Denmark',
	1
	);

INSERT INTO countries
VALUES (
	'HK',
	'HongKong',
	3
	);

INSERT INTO countries
VALUES (
	'NG',
	'Nigeria',
	4
	);

INSERT INTO countries
VALUES (
	'AR',
	'Argentina',
	2
	);

INSERT INTO countries
VALUES (
	'BE',
	'Belgium',
	1
	);

COMMIT;

INSERT INTO locations
VALUES (
	1000,
	'1297 Via Cola di Rie',
	'00989',
	'Roma',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1100,
	'93091 Calle della Testa',
	'10934',
	'Venice',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1200,
	'2017 Shinjuku-ku',
	'1689',
	'Tokyo',
	'Tokyo Prefecture',
	'JP'
	);

INSERT INTO locations
VALUES (
	1300,
	'9450 Kamiya-cho',
	'6823',
	'Hiroshima',
	NULL,
	'JP'
	);

INSERT INTO locations
VALUES (
	1400,
	'2014 Jabberwocky Rd',
	'26192',
	'Southlake',
	'Texas',
	'US'
	);

INSERT INTO locations
VALUES (
	1500,
	'2011 Interiors Blvd',
	'99236',
	'South San Francisco',
	'California',
	'US'
	);

INSERT INTO locations
VALUES (
	1600,
	'2007 Zagora St',
	'50090',
	'South Brunswick',
	'New Jersey',
	'US'
	);

INSERT INTO locations
VALUES (
	1700,
	'2004 Charade Rd',
	'98199',
	'Seattle',
	'Washington',
	'US'
	);

INSERT INTO locations
VALUES (
	1800,
	'147 Spadina Ave',
	'M5V 2L7',
	'Toronto',
	'Ontario',
	'CA'
	);

INSERT INTO locations
VALUES (
	1900,
	'6092 Boxwood St',
	'YSW 9T2',
	'Whitehorse',
	'Yukon',
	'CA'
	);

INSERT INTO locations
VALUES (
	2000,
	'40-5-12 Laogianggen',
	'190518',
	'Beijing',
	NULL,
	'CN'
	);

INSERT INTO locations
VALUES (
	2100,
	'1298 Vileparle (E)',
	'490231',
	'Bombay',
	'Maharashtra',
	'IN'
	);

INSERT INTO locations
VALUES (
	2200,
	'12-98 Victoria Street',
	'2901',
	'Sydney',
	'New South Wales',
	'AU'
	);

INSERT INTO locations
VALUES (
	2300,
	'198 Clementi North',
	'540198',
	'Singapore',
	NULL,
	'SG'
	);

INSERT INTO locations
VALUES (
	2400,
	'8204 Arthur St',
	NULL,
	'London',
	NULL,
	'UK'
	);

INSERT INTO locations
VALUES (
	2500,
	'Magdalen Centre, The Oxford Science Park',
	'OX9 9ZB',
	'Oxford',
	'Oxford',
	'UK'
	);

INSERT INTO locations
VALUES (
	2600,
	'9702 Chester Road',
	'09629850293',
	'Stretford',
	'Manchester',
	'UK'
	);

INSERT INTO locations
VALUES (
	2700,
	'Schwanthalerstr. 7031',
	'80925',
	'Munich',
	'Bavaria',
	'DE'
	);

INSERT INTO locations
VALUES (
	2800,
	'Rua Frei Caneca 1360 ',
	'01307-002',
	'Sao Paulo',
	'Sao Paulo',
	'BR'
	);

INSERT INTO locations
VALUES (
	2900,
	'20 Rue des Corps-Saints',
	'1730',
	'Geneva',
	'Geneve',
	'CH'
	);

INSERT INTO locations
VALUES (
	3000,
	'Murtenstrasse 921',
	'3095',
	'Bern',
	'BE',
	'CH'
	);

INSERT INTO locations
VALUES (
	3100,
	'Pieter Breughelstraat 837',
	'3029SK',
	'Utrecht',
	'Utrecht',
	'NL'
	);

INSERT INTO locations
VALUES (
	3200,
	'Mariano Escobedo 9991',
	'11932',
	'Mexico City',
	'Distrito Federal,',
	'MX'
	);

COMMIT;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO departments
VALUES (
	10,
	'Administration',
	200,
	1700
	);

INSERT INTO departments
VALUES (
	20,
	'Marketing',
	201,
	1800
	);

INSERT INTO departments
VALUES (
	30,
	'Purchasing',
	114,
	1700
	);

INSERT INTO departments
VALUES (
	40,
	'Human Resources',
	203,
	2400
	);

INSERT INTO departments
VALUES (
	50,
	'Shipping',
	121,
	1500
	);

INSERT INTO departments
VALUES (
	60,
	'IT',
	103,
	1400
	);

INSERT INTO departments
VALUES (
	70,
	'Public Relations',
	204,
	2700
	);

INSERT INTO departments
VALUES (
	80,
	'Sales',
	145,
	2500
	);

INSERT INTO departments
VALUES (
	90,
	'Executive',
	100,
	1700
	);

INSERT INTO departments
VALUES (
	100,
	'Finance',
	108,
	1700
	);

INSERT INTO departments
VALUES (
	110,
	'Accounting',
	205,
	1700
	);

INSERT INTO departments
VALUES (
	120,
	'Treasury',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	130,
	'Corporate Tax',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	140,
	'Control And Credit',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	150,
	'Shareholder Services',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	160,
	'Benefits',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	170,
	'Manufacturing',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	180,
	'Construction',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	190,
	'Contracting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	200,
	'Operations',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	210,
	'IT Support',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	220,
	'NOC',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	230,
	'IT Helpdesk',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	240,
	'Government Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	250,
	'Retail Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	260,
	'Recruiting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	270,
	'Payroll',
	NULL,
	1700
	);

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

INSERT INTO jobs
VALUES (
	'AD_PRES',
	'President',
	20000,
	40000
	);

INSERT INTO jobs
VALUES (
	'AD_VP',
	'Administration Vice President',
	15000,
	30000
	);

INSERT INTO jobs
VALUES (
	'AD_ASST',
	'Administration Assistant',
	3000,
	6000
	);

INSERT INTO jobs
VALUES (
	'FI_MGR',
	'Finance Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'FI_ACCOUNT',
	'Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'AC_MGR',
	'Accounting Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'AC_ACCOUNT',
	'Public Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'SA_MAN',
	'Sales Manager',
	10000,
	20000
	);

INSERT INTO jobs
VALUES (
	'SA_REP',
	'Sales Representative',
	6000,
	12000
	);

INSERT INTO jobs
VALUES (
	'PU_MAN',
	'Purchasing Manager',
	8000,
	15000
	);

INSERT INTO jobs
VALUES (
	'PU_CLERK',
	'Purchasing Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'ST_MAN',
	'Stock Manager',
	5500,
	8500
	);

INSERT INTO jobs
VALUES (
	'ST_CLERK',
	'Stock Clerk',
	2000,
	5000
	);

INSERT INTO jobs
VALUES (
	'SH_CLERK',
	'Shipping Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'IT_PROG',
	'Programmer',
	4000,
	10000
	);

INSERT INTO jobs
VALUES (
	'MK_MAN',
	'Marketing Manager',
	9000,
	15000
	);

INSERT INTO jobs
VALUES (
	'MK_REP',
	'Marketing Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'HR_REP',
	'Human Resources Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'PR_REP',
	'Public Relations Representative',
	4500,
	10500
	);

COMMIT;

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	
	'Steven',
	'King',
	'SKING',
	'515.123.4567',
	STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),
	'AD_PRES',
	24000,
	NULL,
	NULL,
	90,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Neena',
	'Kochhar',
	'NKOCHHAR',
	'515.123.4568',
	STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Lex',
	'De Haan',
	'LDEHAAN',
	'515.123.4569',
	STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Alexander',
	'Hunold',
	'AHUNOLD',
	'590.423.4567',
	STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),
	'IT_PROG',
	9000,
	NULL,
	102,
	60,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Bruce',
	'Ernst',
	'BERNST',
	'590.423.4568',
	STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),
	'IT_PROG',
	6000,
	NULL,
	103,
	60,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'David',
	'Austin',
	'DAUSTIN',
	'590.423.4569',
	STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Valli',
	'Pataballa',
	'VPATABAL',
	'590.423.4560',
	STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Diana',
	'Lorentz',
	'DLORENTZ',
	'590.423.5567',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'IT_PROG',
	4200,
	NULL,
	103,
	60,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Nancy',
	'Greenberg',
	'NGREENBE',
	'515.124.4569',
	STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),
	'FI_MGR',
	12000,
	NULL,
	101,
	100,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Daniel',
	'Faviet',
	'DFAVIET',
	'515.124.4169',
	STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),
	'FI_ACCOUNT',
	9000,
	NULL,
	108,
	100,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'John',
	'Chen',
	'JCHEN',
	'515.124.4269',
	STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	8200,
	NULL,
	108,
	100,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Ismael',
	'Sciarra',
	'ISCIARRA',
	'515.124.4369',
	STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7700,
	NULL,
	108,
	100,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Jose Manuel',
	'Urman',
	'JMURMAN',
	'515.124.4469',
	STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7800,
	NULL,
	108,
	100,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Luis',
	'Popp',
	'LPOPP',
	'515.124.4567',
	STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),
	'FI_ACCOUNT',
	6900,
	NULL,
	108,
	100,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Den',
	'Raphaely',
	'DRAPHEAL',
	'515.127.4561',
	STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),
	'PU_MAN',
	11000,
	NULL,
	100,
	30,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Alexander',
	'Khoo',
	'AKHOO',
	'515.127.4562',
	STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),
	'PU_CLERK',
	3100,
	NULL,
	114,
	30,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Shelli',
	'Baida',
	'SBAIDA',
	'515.127.4563',
	STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2900,
	NULL,
	114,
	30,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Sigal',
	'Tobias',
	'STOBIAS',
	'515.127.4564',
	STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2800,
	NULL,
	114,
	30,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Guy',
	'Himuro',
	'GHIMURO',
	'515.127.4565',
	STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),
	'PU_CLERK',
	2600,
	NULL,
	114,
	30,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Karen',
	'Colmenares',
	'KCOLMENA',
	'515.127.4566',
	STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),
	'PU_CLERK',
	2500,
	NULL,
	114,
	30,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Matthew',
	'Weiss',
	'MWEISS',
	'650.123.1234',
	STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),
	'ST_MAN',
	8000,
	NULL,
	100,
	50,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Adam',
	'Fripp',
	'AFRIPP',
	'650.123.2234',
	STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),
	'ST_MAN',
	8200,
	NULL,
	100,
	50,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Payam',
	'Kaufling',
	'PKAUFLIN',
	'650.123.3234',
	STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),
	'ST_MAN',
	7900,
	NULL,
	100,
	50,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Shanta',
	'Vollman',
	'SVOLLMAN',
	'650.123.4234',
	STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),
	'ST_MAN',
	6500,
	NULL,
	100,
	50,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Kevin',
	'Mourgos',
	'KMOURGOS',
	'650.123.5234',
	STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),
	'ST_MAN',
	5800,
	NULL,
	100,
	50,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Julia',
	'Nayer',
	'JNAYER',
	'650.124.1214',
	STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	120,
	50,
	'password'
	);

INSERT INTO employees
(FIRST_NAME 
, LAST_NAME 
, EMAIL 
, PHONE_NUMBER 
, HIRE_DATE 
, JOB_ID 
, SALARY 
, COMMISSION_PCT 
, MANAGER_ID 
, DEPARTMENT_ID 
, PASSWORD)
VALUES (
	'Irene',
	'Mikkilineni',
	'IMIKKILI',
	'650.124.1224',
	STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	120,
	50,
	'password'
	);

Commit;

CREATE PROCEDURE hr.ADD_JOB_HISTORY(  p_emp_id INT(6), p_start_date Date, p_end_date Date, p_job_id VARCHAR(10),p_department_id INT(4))
INSERT INTO hr.job_history (employee_id, start_date, end_date,job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);

commit;


Commit;

ALTER TABLE `hr`.`requests` MODIFY COLUMN `REQ_ID` INT(10) NOT NULL AUTO_INCREMENT;

Commit;