--���� �Լ�
--round(�ݿø�)
--���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����.
select 
    round(3.1414), round(45.923, 0), round(45.923, -1)
from dual;

--trunc(����)
--������ �Ҽ��� �ڸ������� �߶���ϴ�.
select 
    trunc(3.1414, 3), trunc(45.923, 0), trunc(45.923, -1)
from dual;

--ABS (���밪(
select abs(-34) from dual;

--cell(�ø�), eloor(����)
select ceil(3.14), floor(3.14)
from dual;

--mod(������ ���� ����)
select
    10/4, moD(10, 4)
from dual;

----------------------------------------------------------------------------
--��¥�Լ�
--sysdate: ��ǻ���� ���� ��¥, �ð� ������ �����ͼ� �����ϴ� �Լ� -> �ð� ������ ����
SELECT sysdate FROM dual;

SELECT systimestamp FROM dual;

--��¥ ���굵 ����
select sysdate + 1 from dual;

--��¥ Ÿ�԰� ��¥ Ÿ���� ���� ������ �����մϴ�.
--������ ������� �ʽ��ϴ�
select
    first_name,
    (sysdate - hire_date) / 7 as week
from employees;

select
    first_name,
    (sysdate - hire_date) / 365 as week
from employees;

--��¥ �ݿø�, ����
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; --����� �ݿø�
select round(sysdate, 'month') from dual; --�� ����
select round(sysdate, 'day') from dual; --�� ����(�ش� ���� �Ͽ��� ��¥)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; --����� �ݿø�
select trunc(sysdate, 'month') from dual; --�� ����
select trunc(sysdate, 'day') from dual; --�� ����(�ش� ���� �Ͽ��� ��¥)