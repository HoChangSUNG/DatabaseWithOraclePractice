-- ���� 1
--����� �޿� ���� �� ������ �ּ� �޿� �޴� ����� ���� �̸�(��Ī:Name), ����, �޿�,�Ի��� ���
select first_name||' '||last_name "Name", job_id,salary,hire_date
from employees emp1
where salary = (select min(salary)
                from employees emp2 
                where emp2.job_id=emp1.job_id);

--���� 2 
-- �Ҽ� �μ��� ��� �޿����� ���� �޿� �޴� ����� ���� �̸�, �޿�, �μ���ȣ, ���� ���
select first_name||' '||last_name "Name", salary, department_id, job_id
from employees emp1
where salary > (select avg(salary)
                from employees emp2 
                where emp2.department_id=emp1.department_id);
                
--- ���� 3
--������� ������ �ٹ� ��Ȳ ��ȸ, ����O�� �����ϴ� ������ ��� ����� ���, ���� �̸�(��Ī:Name), ����, �Ի��� ���
--�μ����� ���
select EMPLOYEE_ID,first_name||' '||last_name "Name", job_id, hire_date
from EMPLOYEEs
where department_id in (select department_id 
                        from departments
                        where location_id in(select location_id
                                             from locations 
                                             where city like'O%')
                        );
--���� ���
select EMPLOYEE_ID,first_name||' '||last_name "Name", job_id, hire_date
from employees emp
join departments dept on emp.department_id=dept.department_id
join locations loc on dept.location_id=loc.location_id
where city like 'O%';

--����4
--��� ����� �Ҽ� �μ� ��տ��� ���
--������� ���� �̸�(Name), ����, �޿�, �μ���ȣ, �μ� ��տ���(Department Avg Salary) ��� 
select first_name||' '||last_name "Name", job_id,salary,department_id,round((select avg(salary) 
                                                                             from employees emp2
                                                                             where emp1.department_id = emp2.department_id))
from employees emp1;


