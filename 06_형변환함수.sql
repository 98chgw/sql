--����ȯ �Լ� to_char, to_number, to_date
--��¥�� ���ڷ� to_char(��, ����)
--��¥�� ���ڷ� ��ȯ�� �� ���ϴ� �������� ��¥�� ǥ���� �� �ֽ��ϴ�.
select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD DY PM HH:MI:SS') from dual;
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;

--���Ĺ��ڿ� �Բ� ����ϰ� ���� ���ڸ� ""�� ���μ� �����մϴ�.
select
    to_char(sysdate, 'yyyy"��" mm"��" dd"��"')
from dual;

--���ڸ� ���ڷ� to_char(��, ����)
--���Ŀ��� ����ϴ� '9'�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ� ���� ��ȣ�Դϴ�.
select to_char(20000, '99,999') from dual;
select to_char(20000, 'L99,999') from dual;
select to_char(20000.29, '99999.9') from dual;

select
    first_name,
    to_char(salary, '$99,999') as salary
from employees;

--���ڸ� ���ڷ� to_number(��, ����)
select '2000' + 2000 from dual; --�ڵ� �� ��ȯ(���� -> ����)
select to_number('2000') + 2000 from dual; --����� �� ��ȯ
select '$3,300' + 2000 from dual; --����
select to_number('$3,300', '$9,999') + 2000 from dual;

--���ڸ� ��¥�� ��ȯ�ϴ� �Լ� to_date(��, ����)
select to_date('2023-04-13') from dual;
--�־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�. �Ϻθ� ��ȯ�� �� �����ϴ�.
select to_date('2021-03-21 12:23:50', 'YY-MM-DD HH:MI:SS') from dual;

SELECT TO_DATE('2024�� 02�� 12��', 'YYYY"��" MM"��" DD"��"') FROM dual;

--xxxx�� xx�� xx�� -> ���ڿ� �������� ��ȯ�� ������.
--��ȸ �÷����� dateInfo��� �ϰڽ��ϴ�. dual���� ��ȸ�ϼ���.
SELECT '20050102' FROM dual;
SELECT

TO_CHAR (
    TO_DATE ('20050102', 'YYYYMMDD'),
    'YYYY"��" MM"��" DD"��"'
    ) AS dateInfo
FROM dual;

--null���¸� ��ȯ�ϴ� �Լ� nvl(�÷�, ��ȯ�� Ÿ�ٰ�)
select
    first_name,
    nvl(commission_pct, 0) as comm_pct
from employees;


--null ���¸� ��ȯ�ϴ� �Լ� nvl2(�÷�, null�� �ƴ� ����� ��, null�� ����� ��)
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

--DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2 .... default)
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
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/

SELECT employee_id as �����ȣ, first_name, hire_date,
    trunc((sysdate-hire_date) / 365 ) as �ټӳ��
FROM employees 
where (sysdate - hire_date) / 365 >= 17
ORDER BY �ټӳ�� DESC;

/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/


SELECT first_name,
       manager_id,
       CASE manager_id
           WHEN 100 THEN '���'
           WHEN 120 THEN '����'
           WHEN 121 THEN '�븮'
           WHEN 122 THEN '����'
           ELSE '�ӿ�'
       END AS ����
FROM employees
WHERE department_id = 50;






