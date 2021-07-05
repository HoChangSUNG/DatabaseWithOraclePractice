--셈플 문제
--hr 부서에서 회사 조직도를 새로 작성함.
--employees 테이블을 사용하여 대표이사부터 최하위 사원까지의 보고 체계를 kochhar reports to knig과 같은 형태로 출력
select last_name||'reports to'||  prior last_name "Walk"
from employees
start with last_name = 'King'
connect by prior employee_id=manager_id;

--문제1
-- Olson의 보고 체계를 Olson부터 시작하여 직속으로 최상위까지 출력
select prior last_name||' reports to '||last_name "Walk"
from employees
start with last_name = 'Olson'
connect by prior manager_id=employee_id;

-- 문제 2-1
-- level 의사 열을 이용하여 사원들의 전체 계층의 행등급,즉 레벨을 명시적으로 출력
select lpad('-',level-1,'-')||last_name
from employees
start with manager_id is null
connect by prior employee_id=manager_id;
--문제 2-2
-- 위 출력 내용중 'Kochhar'를 제외하고 출력
select lpad('=',level-1,'=')||last_name
from employees
start with manager_id is null
connect by prior employee_id=manager_id and last_name not like 'Kochhar';

--문제3
--사원의 이름,부서명,업무를 합쳐서 출력하고자 하는 계층형 쿼리를 문제 2번을 변형하여 작성
select lpad('*',level,'*')||last_name||' is '||job_id||', department is '||(select department_name 
                                                                            from departments dept 
                                                                            where emp.department_id=dept.department_id) "Hierarchical Query"
from employees emp
start with manager_id is null
connect by prior employee_id=manager_id;

--문제4
-- 직속 계층을 sys_connect_by_path를 이용하여 출력.
select substr(sys_connect_by_path(last_name,'-'),2) name_path
from employees
start with manager_id is null
connect by prior employee_id=manager_id;

