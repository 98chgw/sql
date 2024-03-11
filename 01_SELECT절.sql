-- 오라클의 한 줄 주석.
/*
    여러줄 주석.
*/
     
-- SELECT [컬럼명(여러개 가능)] FROM [테이블 이름]
--SELECT * FROM employees;
SELECT * FROM employees;
--sql문의 관례: 키워드는 대문자, 테이블이름 소문자

--sql 개행 방법
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

SELECT email, phone_number, hire_date
FROM employees;

--컬럼을 조회하는 위치에서 * / + - 연산이 가능합니다
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1
FROM employees;

-- NULL값의 확인 (숫자 0이나 공백과는 다른 존재입니다.)
SELECT
    department_id, commission_pct
From
    employees;

-- alias (컬럼명, 테이블명의 이름을 변경해서 조회)
SELECT
    first_name AS 이름,
    last_name AS 성,
    salary AS 급여
FROM employees;

/*
오라클은 홑따옴표로 문자를 표현하고, 문자열 안에 홑따옴표 특수기호를 표현하고 싶다면
''를 두 번 연속으로 쓰시면 됩니다.
문자열에 연결기호는 ||입니다. 문자열에 덧셈 연산을 허용하지 않는다.
*/
SELECT
    first_name || ' / ' || last_name || '''s salary is  $' || salary AS full_name
FROM employees;

--DISTINCT (중복행 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id fROM employees;

--

--ROWNUM, ROWID
--(로우넘: 쿼리에 의해 반환되는 행 번호를 반환)
-- (로우아이디: 데이터베이스 내의 행의 주소를 반환)
SELECT ROWNUM, ROWID, employee_id
FROM employees;









