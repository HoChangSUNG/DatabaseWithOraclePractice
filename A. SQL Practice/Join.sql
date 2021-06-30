-- ���� 1
--��� ���� 5�� �̻��� �μ��� �μ���, ��� �� ���
--��� �� �������� �������� ����
select department_name,count(*)
from employees emp join departments dept on emp.department_id=dept.department_id
group by department_name
having count(*)>=5
order by count(*) desc;

--����2
--�Ʒ� ���̺�(job_grade,�޿� ��� ���̺�) �����Ͽ� ���.
create table job_grade(grade_level varchar2(3),lowest_sal number,highest_sal number);
insert into job_grade values ('A',1000,2999);
insert into job_grade values ('B',3000,5999);
insert into job_grade values ('C',6000,9999);
insert into job_grade values ('D',10000,14999);
insert into job_grade values ('E',15000,24999);
insert into job_grade values ('F',25000,40000);
commit;
-- �� ����� �޿��� ���� �޿� ��� ����
-- ����� ���� �̸�, ����, �μ��� ,�Ի���, �޿�, �޿� ����� ���
select * from job_grade;
select first_name||' '||last_name "Name", job_id,department_name,hire_date,salary,grade_level
from employees emp join departments dept on emp.department_id=dept.department_id
    join job_grade grade on emp.salary between grade.lowest_sal and grade.highest_sal;
    
-- ���� 3
-- �� ����� ���� ������ ���踦 �̿��� ������ ���� �������� ���
-- employee : ���, manager : �㰢 -> ��� report to �㰢
-- ��� �̸��� �빮�ڷ� ���, ������ ��簡 ���� ����� �����ؼ� ���
select emp.first_name||' '||emp.last_name||' report to '|| upper(manager.first_name||' '||manager.last_name) "Employee vs Manager"
from employees emp left outer join employees manager on emp.MANAGER_ID=manager.EMPLOYEE_ID;
