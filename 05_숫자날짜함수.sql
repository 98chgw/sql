--숫자 함수
--round(반올림)
--원하는 반올림 위치를 매개값으로 지정. 음수를 주는 것도 가능.
select 
    round(3.1414), round(45.923, 0), round(45.923, -1)
from dual;

--trunc(절사)
--정해진 소수점 자리수까지 잘라냅니다.
select 
    trunc(3.1414, 3), trunc(45.923, 0), trunc(45.923, -1)
from dual;

--ABS (절대값(
select abs(-34) from dual;

--cell(올림), eloor(내림)
select ceil(3.14), floor(3.14)
from dual;

--mod(나머지 연산 덧셈)
select
    10/4, moD(10, 4)
from dual;

----------------------------------------------------------------------------
--날짜함수
--sysdate: 컴퓨터의 현재 날짜, 시간 정보를 가져와서 제공하는 함수 -> 시간 정보도 있음
SELECT sysdate FROM dual;

SELECT systimestamp FROM dual;

--날짜 연산도 가능
select sysdate + 1 from dual;

--날짜 타입과 날짜 타입은 뺄셈 연산을 지원합니다.
--덧셈은 허용하지 않습니다
select
    first_name,
    (sysdate - hire_date) / 7 as week
from employees;

select
    first_name,
    (sysdate - hire_date) / 365 as week
from employees;

--날짜 반올림, 절사
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; --년기준 반올림
select round(sysdate, 'month') from dual; --월 기준
select round(sysdate, 'day') from dual; --일 기준(해당 주의 일요일 날짜)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; --년기준 반올림
select trunc(sysdate, 'month') from dual; --월 기준
select trunc(sysdate, 'day') from dual; --일 기준(해당 주의 일요일 날짜)