-- 집합 연산자
-- 서로 다른 쿼리 결과의 행들을 하나로 결합, 비교, 차이를 구할 수 있게 해 주는 연산자
-- UNION(합집합 중복x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.

--중복 허용 X union
select 
    employee_id, first_name
from employees
where hire_date like '04%'
union
select 
    employee_id, first_name
from employees
where department_id =20;

--중복허용 union all
select 
    employee_id, first_name
from employees
where hire_date like '04%'
union all
select 
    employee_id, first_name
from employees
where department_id =20;

--교집합만 추출 intersect
select 
    employee_id, first_name
from employees
where hire_date like '04%'
INTERSECT
select 
    employee_id, first_name
from employees
where department_id =20;

--차집합 a-b
select 
    employee_id, first_name
from employees
where hire_date like '04%'
MINUS
select 
    employee_id, first_name
from employees
where department_id =20;


select 
    employee_id, first_name
from employees
where department_id =20
MINUS
select 
    employee_id, first_name
from employees
where hire_date like '04%';