-- Demonstrate the translation of ER inheritance to the relational model (SQL)

\c scratch

DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS secretaries CASCADE;
DROP TABLE IF EXISTS engineers CASCADE;

-- a general employee
CREATE TABLE employees (
  ssn  char(9),  -- social security number
  name text
);

ALTER TABLE employees
  ADD PRIMARY KEY (ssn);

-- a secretary is a specific employee
CREATE TABLE secretaries (
  typing_speed integer  -- words/minute
)
INHERITS (employees);

-- /!\  constraints (keys, foreign keys) are NOT inherited :-(
ALTER TABLE secretaries
  ADD PRIMARY KEY (ssn);

-- an engineer is a specific employee
CREATE TABLE engineers (
  knows_SQL boolean  -- hopefully...
)
INHERITS (employees);

-- /!\  constraints (keys, foreign keys) are NOT inherited :-(
ALTER TABLE engineers
  ADD PRIMARY KEY (ssn);


\d employees
\d secretaries
\d engineers


INSERT INTO employees(ssn, name) VALUES
  ('123456780', 'Ollie'),
  ('123456781', 'Robbie');

INSERT INTO secretaries(ssn, name, typing_speed) VALUES
  ('123456782', 'Stella', 216),
  ('123456783', 'Chris',  172);

INSERT INTO engineers(ssn, name, knows_SQL) VALUES
  ('123456784', 'Tony',  false),
  ('123456785', 'Nicki', true);


-- ER(secretaries) ⊆ ER(employees)
TABLE secretaries;

-- ER(engineers) ⊆ ER(employees)
TABLE engineers;


-----------------------------------------------------------------------
-- (1) SQL INHERITS implements partial inheritance:

-- ER(employees) = ER(secretaries) ∪ ER(engineers) ∪ ER(ONLY employees)
--                                                 ^^^^^^^^^^^^^^^^^^^^
TABLE employees;

TABLE ONLY employees;



-----------------------------------------------------------------------
-- (2) PostgreSQL's implementation of INHERITS implements
--     overlapping inheritance:

INSERT INTO secretaries(ssn, name, typing_speed) VALUES
  ('123456784', 'Tony', 42);

TABLE secretaries;

-- NB: Will feature two rows ('123456784', 'Tony') now,
--     violating the key constraint on table employees... :-(
--     (limitation of PostgreSQL implementation)
TABLE employees;



-----------------------------------------------------------------------
-- Simulate total inheritance:
-- Cancel any insertion into supertable employees

CREATE RULE employees_total_inheritance AS
  ON INSERT TO employees
  DO INSTEAD NOTHING;

-- will be canceled (INSERT 0 0)
INSERT INTO employees(ssn, name) VALUES
  ('123456786', 'Max');

TABLE employees;


-----------------------------------------------------------------------
-- Simulate disjoint inheritance:
-- Cancel any insertion into subtables if key already present in supertable

CREATE RULE employees_secretaries_disjoint_inheritance AS
  ON INSERT TO secretaries
  WHERE new.ssn = ANY (SELECT e.ssn FROM employees e)
  DO INSTEAD NOTHING;


CREATE RULE employees_engineers_disjoint_inheritance AS
  ON INSERT TO engineers
  WHERE new.ssn = ANY (SELECT e.ssn FROM employees e)
  DO INSTEAD NOTHING;

-- will be canceled (INSERT 0 0)
INSERT INTO secretaries(ssn, name, typing_speed) VALUES
  ('123456785', 'Nicki', 120);




