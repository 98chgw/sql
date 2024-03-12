--�׷��Լ� avg, max, min, sum, count
--�׷�ȭ�� ���� �������� ������ �׷��� ���̺� ��ü�� �˴ϴ�.
select
    avg(salary),
    max(salary),
    min(salary),
    sum(salary),
    count(salary)
from employees;

select count(*) from employees; --�� ���� ������ ��
select count (first_name) from employees;
select count(commission_pct) from employees;

select * from employees;

--�μ��� �׷�ȭ, �׷��Լ��� ���
select
    department_id,
    AVG(salary)
from employees
group by department_id;

--������ ��
-- �׷� �Լ��� �ܵ������� ���� �� ��ü ���̺��� �׷��� ����� ������
-- �Ϲ� �÷��� ���ÿ� �׳� ����� �� �����ϴ�. �׷��� �ʿ��մϴ�.
select
    department_id,
    AVG(salary)
from employees;

--group by���� ����� ��
select
    job_id,
    department_id,
    avg(salary)
from employees
GROUP BY department_id; --����

--group by�� 2�� �̻� ���
select
    job_id,
    department_id,
    avg(salary)
from employees
GROUP BY department_id, job_id;

--group by�� ���� �׷�ȭ �� �� ������ �� ��� having�� ���
--where�� �Ϲ� ������. group by���� ���� ����˴ϴ�.
select
    department_id,
    avg(salary)
from employees
group by department_id
HAVING sum(salary)>10000; 

select
    department_id,
    avg(salary)
from employees
group by department_id
HAVING avg(salary)>10000;


select
    job_id,
    count(*)
from employees
group by job_id
having count(*) >= 5;

--�μ� ���̵� 50�̻��� �͵��� �׷�ȭ ��Ű��, �׷� �޿� ����� 5000�̻� ��ȸ
-- from -> where -> group by -> having -> select -> order by
select
    department_id,
    avg(salary) as ���
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000
order by ��� desc;


select * from employees;

/*
���� 1.
1-1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
select
    job_id,
    count(*) as �����,
    avg(salary) as �޿����
from employees
group by job_id
order by �޿���� desc;



/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/

select 
    to_char(hire_date, 'yy') as �Ի�⵵,
    count(*) as �����
from employees
group by to_char(hire_date, 'yy')
order by �Ի�⵵;


/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/

select 
    department_id,
    avg(salary) as ��ձ޿�
from employees
where salary >= 5000
group by department_id
having avg(salary) >= 7000;

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/
select 
    department_id,
    TRUNC(avg(salary + salary*commission_pct), 2) as avg_salary,
    SUM(salary + salary*commission_pct) as sum,
    count(*) as count
from employees
where commission_pct IS NOT NULL
GROUP BY department_id;

