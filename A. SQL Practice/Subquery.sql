-- 문제 1
--사원의 급여 정보 중 업무별 최소 급여 받는 사원의 성과 이름(별칭:Name), 업무, 급여,입사일 출력
select first_name||' '||last_name "Name", job_id,salary,hire_date
from employees emp1
where salary = (select min(salary)
                from employees emp2 
                where emp2.job_id=emp1.job_id);

--문제 2 
-- 소속 부서의 평균 급여보다 많은 급여 받는 사원의 성과 이름, 급여, 부서번호, 업무 출력
select first_name||' '||last_name "Name", salary, department_id, job_id
from employees emp1
where salary > (select avg(salary)
                from employees emp2 
                where emp2.department_id=emp1.department_id);
                
--- 문제 3
--사원들의 지역별 근무 현황 조회, 영문O로 시작하는 지역에 사는 사원의 사번, 성과 이름(별칭:Name), 업무, 입사일 출력
--부속질의 사용
select EMPLOYEE_ID,first_name||' '||last_name "Name", job_id, hire_date
from EMPLOYEEs
where department_id in (select department_id 
                        from departments
                        where location_id in(select location_id
                                             from locations 
                                             where city like'O%')
                        );
--조인 사용
select EMPLOYEE_ID,first_name||' '||last_name "Name", job_id, hire_date
from employees emp
join departments dept on emp.department_id=dept.department_id
join locations loc on dept.location_id=loc.location_id
where city like 'O%';

--문제4
--모든 사원의 소속 부서 평균연봉 계산
--사원별로 성과 이름(Name), 업무, 급여, 부서번호, 부서 평균연봉(Department Avg Salary) 출력 
select first_name||' '||last_name "Name", job_id,salary,department_id,round((select avg(salary) 
                                                                             from employees emp2
                                                                             where emp1.department_id = emp2.department_id))
from employees emp1;


