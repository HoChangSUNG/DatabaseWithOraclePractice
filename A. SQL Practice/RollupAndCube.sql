-- 셈플 코드
-- 부서번호,업무를 기준으로 전체 행을 그룹별로 나누어 급여 합계, 인원수를 출력,부서번호와 업무 각각에 대해 그룹화된 합계와 인원수 출력해라
select department_id, job_id
        ,to_char(sum(salary),'$999,999,00') as "Salary SUM"
        ,count(employee_id) as "COUNT EMPs"
from employees
group by rollup(department_id,job_id)
order by department_id;

--문제 1
-- 위의 셈플 코드를 수정하여 job_id에 대해서도 총 집계가 이루어지도록 쿼리를 수정해라
select department_id, job_id
        ,to_char(sum(salary),'$999,999,00') as "Salary SUM"
        ,count(employee_id) as "COUNT EMPs"
from employees
group by cube(department_id,job_id)
order by department_id;

--문제3
--셈플 문제의 결과를 이용, 부서에 대한 집계 결과가 아니면 (ALL-DEPTS), 업무에 대한 집계 결과가 아니면 (ALL-JOBS)출력,
--해당 집계에 대한 사원 수와 평균 연봉 구해라
select decode(grouping(department_id),1,'ALL-DEPTS',department_id) "Dept"
        ,decode(grouping(job_id),1,'ALL-JOBS',job_id) "Jobs"
        ,count(employee_id) as "COUNT EMPs"
        ,to_char(avg(salary*12),'$999,999,00') as "Avg Ann_sal"
from employees
group by rollup(department_id,job_id)
order by department_id;