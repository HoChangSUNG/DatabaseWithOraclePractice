--���� 1 
--����� �̸�(last_name)�߿� e �� o ���ڰ� ���Ե� ��� ���, ��Ī: e and o Name
select last_name "e or o Name" 
from employees 
where last_name like'%e%' and last_name like'%o%';

--���� 2
--2006�� 5�� 20��~2007�� 5�� 20�Ͽ� ���� ������� ���� �̸�(��Ī :Name),�����ȣ,������� ���
--�Ի��� ������ ����
select first_name||' '||last_name Name, job_id,hire_date 
from employees 
where hire_date between '2006/05/20' and '2007/05/20' order by hire_date; 

--���� 3
-- ������ �޴� ��� ����� ���� �̸�(��Ī:Name),�޿�,����,����� ���
-- �޿� ���� �� ����,�޿� ���Ͻ� ����� ū ������ ����
select first_name||' '||last_name Name,salary,job_id,commission_pct 
from employees
where commission_pct is not null 
order by salary desc, commission_pct desc;

