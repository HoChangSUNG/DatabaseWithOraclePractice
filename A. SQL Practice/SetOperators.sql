--문제1
--모든 사원의 업무 이력 변경 정보 및 업무 변경에 따른 부서정보를 사번이 빠른 순서대로 출력
select employee_id,job_id,department_id
from employees
union all
select employee_id,job_id,department_id
from job_history
order by employee_id;

--문제2
--문제2-1
--employees,job_history 테이블을 이용 -> 어떤 사원의 업무가 변경되고,그대로 유지되고 있는지를 알 수 있음.
--두 테이블을 이용하여 업무 변경 없이 같은 업무를 보고 있는 사원의 사번,업무 출력
select employee_id,job_id
from employees
intersect
select employee_id,job_id
from job_history;
--문제 2-2
--위 결과 이용해 176번 사원의 업무 이력의 변경 날짜 이력을 조회
select employee_id,job_id,start_date,end_date 
from job_history 
where employee_id=176
union all
select employee_id,job_id,null,null 
from employees 
where employee_id=176;

--문제 3
-- job_history, employees 테이블을 이용하여 한번도 업무가 변경되지 않은 사원의 사번 출력
select employee_id
from employees
minus
select employee_id
from job_history;