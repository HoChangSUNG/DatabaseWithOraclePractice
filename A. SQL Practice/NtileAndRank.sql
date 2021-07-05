--���� ����
--NTILE()�� �̿��Ͽ� �μ��� �޿� �հ� ���
-- �޿� �հ� ���� ū �� ->1, ���� ������ ->4�� ������ bucket(���)�� ������ ���, Bucket(���)�� �������� �������� ����
select department_id, sum(salary),ntile(4) over(order by sum(salary) desc) as "Bucket#"
from employees
group by department_id
order by 3;

--����1
-- �� ����� �Ҽӵ� �μ����� �޿��� �������� ������������ ����
-- rank(),dense_rank(),row_number() �̿�
select employee_id,last_name,salary,department_id
    ,rank() over(PARTITION by department_id order by salary desc) "Rank"
    ,dense_rank() over(partition by department_id order by salary desc) "Dense_Rank"
    ,row_number() over(partition by department_id order by salary desc) "Row_Number"
from employees
order by department_id ,salary desc;

-- ����2
-- 50�� �μ��� ��� ������ �޿� ������ �������� �����ϰ� ����,���� ���� �޿��� �Բ� ���
-- LAG().LEAD()�Լ� ���
select employee_id,last_name,salary
    ,nvl(lead(salary) over(order by salary ),0) "Prev_Sal"
    ,nvl(lag(salary) over(order by salary ),0) "Next_sal"
from employees
where department_id=50
order by salary desc;

--����3
-- �Ҽӵ� �μ����� �޿��� ���� ���� �ްų�(Max_Emp_name) ���� ���� �޴�(Min_Emp_name) ����� �̸� ���
select department_id,count(*)
        ,min(last_name) keep (dense_rank first order by salary desc ) "Max_Emp_name"
        ,min(last_name) keep (dense_rank last order by salary desc) "Min_Emp_name"
from employees
group by department_id
order by department_id;