--형변환 함수 to_char, to_number, to_date
--날짜를 문자로 to_char(값, 형식)
--날짜를 문자로 변환할 때 원하는 형식으로 날짜를 표현할 수 있습니다.
select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') from dual;
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;

--서식문자와 함께 사용하고 싶은 문자를 ""로 감싸서 전달합니다.
select
    to_char(sysdate, 'yyyy"년" mm"월" dd"일"')
from dual;

--숫자를 문자로 to_char(값, 형식)
--형식에서 사용하는 '9'는 실제 숫자 9가 아니라 자리스를 표현하기 위한 기호입니다.
select to_char(20000, '99,999') from dual;
select to_char(20000, 'L99,999') from dual;
select to_char(20000.29, '99999.9') from dual;

select
    first_name,
    to_char(salary, '$99,999') as salary
from employees;

--문자를 숫자로 to_number(값, 형식)
select '2000' + 2000 from dual; --자동 형 변환(문자 -> 숫자)
select to_number('2000') + 2000 from dual; --명시적 형 변환
select '$3,300' + 2000 from dual; --에러
select to_number('$3,300', '$9,999') + 2000 from dual;

--문자를 날짜로 변환하는 함수 to_date(값, 형식)
select to_date('2023-04-13') from dual;
--주어진 문자열을 모두 변환해야 합니다. 일부만 변환할 수 없습니다.
select to_date('2021-03-21 12:23:50', 'YY-MM-DD HH:MI:SS') from dual;

SELECT TO_DATE('2024년 02월 12일', 'YYYY"년" MM"월" DD"일"') FROM dual;

--xxxx년 xx월 xx일 -> 문자열 형식으로 변환해 보세요.
--조회 컬럼명은 dateInfo라고 하겠습니다. dual에서 조회하세요.
SELECT '20050102' FROM dual;
SELECT

TO_CHAR (
    TO_DATE ('20050102', 'YYYYMMDD'),
    'YYYY"년" MM"월" DD"일"'
    ) AS dateInfo
FROM dual;

--null형태를 변환하는 함수 nvl(컬럼, 변환할 타겟값)
select
    first_name,
    nvl(commission_pct, 0) as comm_pct
from employees;


--null 형태를 변환하는 함수 nvl2(컬럼, null이 아닐 경우의 값, null일 경우의 값)
select
    first_name,
    salary,
    nvl2(
        commission_pct,
        salary + (salary * commission_pct),
        salary
    ) as real_salary
from employees;


select
    first_name,
    salary,
    salary + (salary * commission_pct)
from employees
where commission_pct is not null;

--DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2 .... default)
select
    first_name,
    job_id,
    salary,
    DECODE(
        job_id,
        'IT_PROG', salary*1.1,
        'FI_MGR', salary*1.2,
        'AD_VP', salary*1.3,
        salary
    ) as result
from employees;

--case when then end
select
    first_name,
    job_id,
    salary,
    (case job_id
        when 'IT_PROG' THEN salary*1.1
        when 'FI_MGR' THEN salary*1.2
        when 'AD_VP' THEN salary*1.3
        when 'FI_ACCOUNT' THEN salary*1.4
        else salary
    end) AS result
from employees;


/*
문제 1.
현재일자를 기준으로 employees테이블의 입사일자(hire_date)를 참조해서 근속년수가 17년 이상인
사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다
*/

SELECT employee_id as 사원번호, first_name, hire_date,
    trunc((sysdate-hire_date) / 365 ) as 근속년수
FROM employees 
where (sysdate - hire_date) / 365 >= 17
ORDER BY 근속년수 DESC;

/*
문제 2.
EMPLOYEES 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
100이라면 ‘사원’, 
120이라면 ‘주임’
121이라면 ‘대리’
122라면 ‘과장’
나머지는 ‘임원’ 으로 출력합니다.
조건 1) department_id가 50인 사람들을 대상으로만 조회합니다
*/


SELECT first_name,
       manager_id,
       CASE manager_id
           WHEN 100 THEN '사원'
           WHEN 120 THEN '주임'
           WHEN 121 THEN '대리'
           WHEN 122 THEN '과장'
           ELSE '임원'
       END AS 직급
FROM employees
WHERE department_id = 50;






