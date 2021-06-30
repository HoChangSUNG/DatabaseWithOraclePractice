--문제 1 
--사원의 이름(last_name)중에 e 및 o 글자가 포함된 사원 출력, 별칭: e and o Name
select last_name "e or o Name" 
from employees 
where last_name like'%e%' and last_name like'%o%';

--문제 2
--2006년 5월 20일~2007년 5월 20일에 고용된 사원들의 성과 이름(별칭 :Name),사원번호,고용일자 출력
--입사일 빠른순 정렬
select first_name||' '||last_name Name, job_id,hire_date 
from employees 
where hire_date between '2006/05/20' and '2007/05/20' order by hire_date; 

--문제 3
-- 수당을 받는 모든 사원의 성과 이름(별칭:Name),급여,업무,수당률 출력
-- 급여 많은 순 정렬,급여 동일시 수당률 큰 순서로 정렬
select first_name||' '||last_name Name,salary,job_id,commission_pct 
from employees
where commission_pct is not null 
order by salary desc, commission_pct desc;

