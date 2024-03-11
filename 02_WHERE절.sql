SELECT * FROM employees;

--where�� �� (������ ���� ��/�ҹ��� ����)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';


SELECT *
FROM employees
WHERE last_name = 'King';

SELECT *
FROM employees
WHERE department_id = 50;

SELECT * 
FROM employees
WHERE salary >= 15000 
AND salary < 20000;
          
SELECT *
FROM employees
WHERE hire_date = '04/01/30';

--�������� �� ���� (BETWEEN, IN, LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN �������� ��� (Ư�� ����� ���� �� ���)
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD,VP');

--LIKE ������ (���� ���ڿ� ���� ����)
-- %�� ��� ���ڵ�, _�� �������� �ڸ�(��ġ)�� ǥ���� ��
select first_name, last_name, hire_date
from employees
where hire_date like '03%';

select first_name, last_name, hire_date
from employees
where hire_date like '%15';

select first_name, last_name, hire_date
from employees
where hire_date like '%05%';

select first_name, last_name, hire_date
from employees
where hire_date like '___05%';

select * from employees
where commission_pct is null;

select * from employees 
where commission_pct is not null;

--AND, OR
--AND�� OR���� ���� �ӵ��� ������
select * from employees
where job_id= 'IT-PROG'
AND salary >= 6000
OR job_id = 'FI_MGR';


select * from employees
where (job_id= 'IT-PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

--�������� ���� (SELECT ������ ���� �������� ��ġ�˴ϴ�.)
--ASC : ascending �������� -> ������ �����մϴ�.
--DESC : descending ��������
SELECT * FROM employees
ORDER BY hire_date ASC;

select * from employees
order by hire_date DESC;

select * from employees
where job_id = 'IT_PROG'
order by first_name asc;

select * from employees
where salary >= 5000
order by employee_id desc;

select 
    first_name,
    salary*12 as pay
from employees
order by pay asc;

--lower(�빮��), initcap(�ձ��ڸ� �����), upper(�빮��)

SELECT * from dual;

/*
dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/




