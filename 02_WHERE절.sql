SELECT * FROM employees;

--where절 비교 (데이터 값은 대/소문자 구분)
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

--데이터의 행 제한 (BETWEEN, IN, LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD,VP');

--LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 표현할 때
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
--AND가 OR보다 연산 속도가 빠르다
select * from employees
where job_id= 'IT-PROG'
AND salary >= 6000
OR job_id = 'FI_MGR';


select * from employees
where (job_id= 'IT-PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

--데이터의 정렬 (SELECT 구문의 가장 마지막에 배치됩니다.)
--ASC : ascending 오름차순 -> 생략이 가능합니다.
--DESC : descending 내림차순
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

--lower(대문자), initcap(앞글자만 대분자), upper(대문자)

SELECT * from dual;

/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/




