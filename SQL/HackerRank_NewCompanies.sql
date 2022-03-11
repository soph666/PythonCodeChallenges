-- https://www.hackerrank.com/challenges/the-company/problem

-- CREATE EXAMPLE
CREATE TABLE Company
  (
     company_code VARCHAR(200), founder VARCHAR(200)
  );

INSERT INTO Company
            (company_code, founder)
VALUES      ("C1", "Monika"),
            ("C2","Samantha");

CREATE TABLE Lead_Manager
  (
     lead_manager_code VARCHAR(200), company_code VARCHAR(200)
  );

INSERT INTO Lead_Manager
            (lead_manager_code, company_code)
VALUES      ("LM1", "C1"),
            ("LM2","C2");

CREATE TABLE Senior_Manager
  (
     senior_manager_code VARCHAR(200),
     lead_manager_code VARCHAR(200),
     company_code VARCHAR(200)
  );

INSERT INTO Senior_Manager
            (senior_manager_code, lead_manager_code, company_code)
VALUES      ("SM1", "LM1", "C1"),
            ("SM1", "LM1", "C1"),
            ("SM3", "LM2","C2");

CREATE TABLE Manager
  (
     manager_code VARCHAR(200),
     senior_manager_code VARCHAR(200),
     lead_manager_code VARCHAR(200),
     company_code VARCHAR(200)
  );

INSERT INTO Manager
            (manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES      ("M1", "SM1", "LM1", "C1"),
            ("M2", "SM3", "LM2", "C2"),
            ("M3", "SM3", "LM2", "C2");

CREATE TABLE Employee
  (
     employee_code VARCHAR(200),
     manager_code VARCHAR(200),
     senior_manager_code VARCHAR(200),
     lead_manager_code VARCHAR(200),
     company_code VARCHAR(200)
  );

INSERT INTO Employee
            (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code)
VALUES      ("E1", "M1", "SM1", "LM1", "C1"),
            ("E2", "M1", "SM1", "LM1", "C1"),
            ("E3", "M2", "SM3", "LM2", "C2"),
            ("E4", "M3", "SM3", "LM2", "C2");


