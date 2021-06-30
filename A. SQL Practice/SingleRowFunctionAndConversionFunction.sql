--문제1
--성(last_name)이 s 로 끝나는 사원의 이름, 업무를 출력
--이름(first_name)과 성(last_name) 첫 자 ->  대문자, 업무 ->모두 대문자
--별칭 : Employee JOBs
select initcap(first_name)||' '||initcap(last_name)||' is a '||upper(job_id) "Employee JOBs"
from employees
where last_name like '%s';

--문제 2
--모든 사원의 연봉 표시 보고서 작성
--성과 이름(별칭 : Name), 급여, 수당 여부에 따른 연봉을 포함해 출력
--수당 여부 -> o -> Salary + commission
--         -> x -> Salary only
--연봉 높은 순 정렬
select first_name||' '||last_name Name, salary,(salary + salary*nvl(commission_pct,0))*12 "Annual Salary",nvl2(commission_pct,'salary + 0'||commission_pct,'salary only') "Commission ?"
from employees
order by "Annual Salary" desc;

--문제3
--모든 사원의 성과 이름, 입사일 ,입사 요일 출력
--주(week)의 시작인 일요일부터 출력되도록 정렬
--to_char(hire_date,'d') ->일:1 월:2 화:3 수:4 목:5 금:6 토:7라는 숫자값 가짐
select first_name||' '||last_name Name,to_char(hire_date,'day') "Day of the week"
from employees
order by to_char(hire_date,'d'); 
