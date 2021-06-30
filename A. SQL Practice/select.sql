--문제1
--사원 정보 테이블(employees)에서 
--사원의 성과 이름 -> Name, 업무 -> Job, 급여->Salary, 
--연봉에 100$ 보너스 추가하여 계산한 연봉 -> Increased ann_salary,
--급여에 100$ 보너스 추가하여 계산한 연봉 -> Increased Salary 
select first_name||' '||last_name "name", job_id job, salary, salary*12+100 "Increased ann_salary", (salary+100)*12 "Increased Salary"
from employees;

--문제2
--사원 정보 테이블(employees)에서 모든 사원의 성(last_name)과 연봉 -> '성:1 Year Salary = $연봉'형식으로 출력, 1 Year Salary라는 별칭 부여
select last_name ||': 1 Year Salary = $'||salary*12 from employees;

--문제3
-- 부서별로 담당하는 업무를 한번씩만 출력하시오
select distinct(department_id),job_id from employees;s