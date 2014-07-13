DROP TABLE emp;
DROP TABLE dept;
DROP TABLE salgrade;
DROP TABLE emp_honsya;
DROP TABLE emp_shisya;
DROP TABLE orders;
DROP TABLE zaiko;
DROP TABLE emp_huge;

CREATE TABLE dept (deptno number(2) not null,
                   dname varchar2(14),
                   loc varchar2(13));

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE emp (empno NUMBER(4),
                  ename VARCHAR2(10),
                  job VARCHAR2(9),
                  mgr NUMBER(4),
                  hiredate DATE,
                  sal NUMBER(7,2),
                  comm NUMBER(7,2),
                  deptno NUMBER(2));

INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,null,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-02-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,to_date('22-02-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,to_date('02-04-1981','dd-mm-yyyy'),2975,null,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-09-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,to_date('01-05-1981','dd-mm-yyyy'),2850,null,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,to_date('09-06-1981','dd-mm-yyyy'),2450,null,10);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,null,20);
INSERT INTO emp VALUES (7839,'KING','PRESIDENT',null,to_date('17-11-1981','dd-mm-yyyy'),5000,null,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,to_date('08-09-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,to_date('12-01-1983','dd-mm-yyyy'),1100,null,20);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,to_date('03-12-1981','dd-mm-yyyy'),950,null,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,to_date('03-12-1981','dd-mm-yyyy'),3000,null,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,to_date('23-01-1982','dd-mm-yyyy'),1300,null,10);

CREATE TABLE salgrade (grade NUMBER,
                       losal NUMBER,
                       hisal NUMBER);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);

CREATE TABLE emp_honsya (empno NUMBER(5),
                         ename VARCHAR2(12),
                         job VARCHAR2(12));

INSERT INTO emp_honsya VALUES (7369,'SMITH','CLERK');
INSERT INTO emp_honsya VALUES (7499,'ALLEN','SALESMAN');
INSERT INTO emp_honsya VALUES (7566,'JONES','MANAGER');

CREATE TABLE emp_shisya (empno NUMBER(5),
                         ename VARCHAR2(12),
                         job VARCHAR2(12));

INSERT INTO emp_shisya VALUES (7369,'SMITH','ANALYST');
INSERT INTO emp_shisya VALUES (7499,'ALLEN','SALESMAN');

CREATE TABLE orders (product_id NUMBER(5),
                     order_count NUMBER(5),
                     sales NUMBER(5));

INSERT INTO orders VALUES (1211,3,3000);
INSERT INTO orders VALUES (1212,2,1800);
INSERT INTO orders VALUES (1214,1,1500);

CREATE TABLE zaiko (product_id NUMBER(5),
                    zaiko_count NUMBER(5));

INSERT INTO zaiko VALUES (1211,3);
INSERT INTO zaiko VALUES (1212,5);
INSERT INTO zaiko VALUES (1213,2);
INSERT INTO zaiko VALUES (1214,1);

CREATE TABLE emp_huge 
AS SELECT * FROM emp WHERE 0=1;

ALTER TABLE emp_huge 
MODIFY (empno NUMBER(5) NOT NULL);

ALTER TABLE emp_huge 
MODIFY (ename CHAR(255));

ALTER TABLE emp_huge
MODIFY (mgr CHAR(4));

INSERT INTO emp_huge VALUES ('0','DAIZEN','AUTHOR',1,to_date('17-12-1980','dd-mm-yyyy'),1000,null,10);

BEGIN
  FOR i IN 1..10000 LOOP
    INSERT INTO emp_huge VALUES (i,DBMS_RANDOM.STRING('x',8),null,2,sysdate,1000+i,300,30);
  COMMIT;
END LOOP;
END;
/

SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM emp_honsya;
SELECT * FROM emp_shisya;
SELECT * FROM orders;
SELECT * FROM zaiko;
