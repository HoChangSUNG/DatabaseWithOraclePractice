-- ���� 1
-- �μ��� �޿� �հ�,���,�ִ�,�ּڰ��� ����
-- ���� �ڸ��� �� �ڸ� ���б�ȣ, $�� �Բ� ��� ex) $4,400.00
-- ��� ��� : to_char(sum(salary),'$999,999.00') ���,�μ� ��ȣ ���� �������� ����
select department_id,to_char(sum(salary),'$999,999.00'),to_char(avg(salary),'$999,999.00'),to_char(max(salary),'$999,999.00'),to_char(min(salary),'$999,999.00')
from employees
group by department_id
having department_id is not null
order by department_id;

-- ���� 2
-- ������ �޿� ����� $10000���� ū ��� ��ȸ -> ����,�޿� ��� ���
-- ��, CLERK�� �޿� ����� ����, �޿� ����� ���� ������� ���
select job_id,avg(salary) as "Avg Salary"
from employees
group by job_id
having job_id != 'CLERK' and avg(salary)>10000
order by avg(salary) desc;