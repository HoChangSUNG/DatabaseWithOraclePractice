--����1
--��� ���� ���̺�(employees)���� 
--����� ���� �̸� -> Name, ���� -> Job, �޿�->Salary, 
--������ 100$ ���ʽ� �߰��Ͽ� ����� ���� -> Increased ann_salary,
--�޿��� 100$ ���ʽ� �߰��Ͽ� ����� ���� -> Increased Salary 
select first_name||' '||last_name "name", job_id job, salary, salary*12+100 "Increased ann_salary", (salary+100)*12 "Increased Salary"
from employees;

--����2
--��� ���� ���̺�(employees)���� ��� ����� ��(last_name)�� ���� -> '��:1 Year Salary = $����'�������� ���, 1 Year Salary��� ��Ī �ο�
select last_name ||': 1 Year Salary = $'||salary*12 from employees;

--����3
-- �μ����� ����ϴ� ������ �ѹ����� ����Ͻÿ�
select distinct(department_id),job_id from employees;s