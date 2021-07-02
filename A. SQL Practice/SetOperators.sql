--����1
--��� ����� ���� �̷� ���� ���� �� ���� ���濡 ���� �μ������� ����� ���� ������� ���
select employee_id,job_id,department_id
from employees
union all
select employee_id,job_id,department_id
from job_history
order by employee_id;

--����2
--����2-1
--employees,job_history ���̺��� �̿� -> � ����� ������ ����ǰ�,�״�� �����ǰ� �ִ����� �� �� ����.
--�� ���̺��� �̿��Ͽ� ���� ���� ���� ���� ������ ���� �ִ� ����� ���,���� ���
select employee_id,job_id
from employees
intersect
select employee_id,job_id
from job_history;
--���� 2-2
--�� ��� �̿��� 176�� ����� ���� �̷��� ���� ��¥ �̷��� ��ȸ
select employee_id,job_id,start_date,end_date 
from job_history 
where employee_id=176
union all
select employee_id,job_id,null,null 
from employees 
where employee_id=176;

--���� 3
-- job_history, employees ���̺��� �̿��Ͽ� �ѹ��� ������ ������� ���� ����� ��� ���
select employee_id
from employees
minus
select employee_id
from job_history;