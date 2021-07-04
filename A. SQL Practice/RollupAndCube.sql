-- ���� �ڵ�
-- �μ���ȣ,������ �������� ��ü ���� �׷캰�� ������ �޿� �հ�, �ο����� ���,�μ���ȣ�� ���� ������ ���� �׷�ȭ�� �հ�� �ο��� ����ض�
select department_id, job_id
        ,to_char(sum(salary),'$999,999,00') as "Salary SUM"
        ,count(employee_id) as "COUNT EMPs"
from employees
group by rollup(department_id,job_id)
order by department_id;

--���� 1
-- ���� ���� �ڵ带 �����Ͽ� job_id�� ���ؼ��� �� ���谡 �̷�������� ������ �����ض�
select department_id, job_id
        ,to_char(sum(salary),'$999,999,00') as "Salary SUM"
        ,count(employee_id) as "COUNT EMPs"
from employees
group by cube(department_id,job_id)
order by department_id;

--����3
--���� ������ ����� �̿�, �μ��� ���� ���� ����� �ƴϸ� (ALL-DEPTS), ������ ���� ���� ����� �ƴϸ� (ALL-JOBS)���,
--�ش� ���迡 ���� ��� ���� ��� ���� ���ض�
select decode(grouping(department_id),1,'ALL-DEPTS',department_id) "Dept"
        ,decode(grouping(job_id),1,'ALL-JOBS',job_id) "Jobs"
        ,count(employee_id) as "COUNT EMPs"
        ,to_char(avg(salary*12),'$999,999,00') as "Avg Ann_sal"
from employees
group by rollup(department_id,job_id)
order by department_id;