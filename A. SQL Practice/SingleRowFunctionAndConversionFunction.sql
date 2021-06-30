--����1
--��(last_name)�� s �� ������ ����� �̸�, ������ ���
--�̸�(first_name)�� ��(last_name) ù �� ->  �빮��, ���� ->��� �빮��
--��Ī : Employee JOBs
select initcap(first_name)||' '||initcap(last_name)||' is a '||upper(job_id) "Employee JOBs"
from employees
where last_name like '%s';

--���� 2
--��� ����� ���� ǥ�� ���� �ۼ�
--���� �̸�(��Ī : Name), �޿�, ���� ���ο� ���� ������ ������ ���
--���� ���� -> o -> Salary + commission
--         -> x -> Salary only
--���� ���� �� ����
select first_name||' '||last_name Name, salary,(salary + salary*nvl(commission_pct,0))*12 "Annual Salary",nvl2(commission_pct,'salary + 0'||commission_pct,'salary only') "Commission ?"
from employees
order by "Annual Salary" desc;

--����3
--��� ����� ���� �̸�, �Ի��� ,�Ի� ���� ���
--��(week)�� ������ �Ͽ��Ϻ��� ��µǵ��� ����
--to_char(hire_date,'d') ->��:1 ��:2 ȭ:3 ��:4 ��:5 ��:6 ��:7��� ���ڰ� ����
select first_name||' '||last_name Name,to_char(hire_date,'day') "Day of the week"
from employees
order by to_char(hire_date,'d'); 
