--���� ����
--hr �μ����� ȸ�� �������� ���� �ۼ���.
--employees ���̺��� ����Ͽ� ��ǥ�̻���� ������ ��������� ���� ü�踦 kochhar reports to knig�� ���� ���·� ���
select last_name||'reports to'||  prior last_name "Walk"
from employees
start with last_name = 'King'
connect by prior employee_id=manager_id;

--����1
-- Olson�� ���� ü�踦 Olson���� �����Ͽ� �������� �ֻ������� ���
select prior last_name||' reports to '||last_name "Walk"
from employees
start with last_name = 'Olson'
connect by prior manager_id=employee_id;

-- ���� 2-1
-- level �ǻ� ���� �̿��Ͽ� ������� ��ü ������ ����,�� ������ ��������� ���
select lpad('-',level-1,'-')||last_name
from employees
start with manager_id is null
connect by prior employee_id=manager_id;
--���� 2-2
-- �� ��� ������ 'Kochhar'�� �����ϰ� ���
select lpad('=',level-1,'=')||last_name
from employees
start with manager_id is null
connect by prior employee_id=manager_id and last_name not like 'Kochhar';

--����3
--����� �̸�,�μ���,������ ���ļ� ����ϰ��� �ϴ� ������ ������ ���� 2���� �����Ͽ� �ۼ�
select lpad('*',level,'*')||last_name||' is '||job_id||', department is '||(select department_name 
                                                                            from departments dept 
                                                                            where emp.department_id=dept.department_id) "Hierarchical Query"
from employees emp
start with manager_id is null
connect by prior employee_id=manager_id;

--����4
-- ���� ������ sys_connect_by_path�� �̿��Ͽ� ���.
select substr(sys_connect_by_path(last_name,'-'),2) name_path
from employees
start with manager_id is null
connect by prior employee_id=manager_id;

