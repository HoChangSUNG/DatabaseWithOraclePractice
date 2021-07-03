-- 문제 1
--부서별 급여 합계를 구하고, 결과를 다음과 같이 표현
--sum(salary)>100000 -> 'Excellent'
--sum(salary)>50000 -> 'Good
--sum(salary)>10000 -> 'Medium'
--sum(salary)<=10000 -> 'Well'
select department_id ,sum(salary) sum_sal
       ,case when sum(salary)>100000 then 'Excellent'
             when sum(salary)>50000 then 'Good'
             when sum(salary)>10000 then 'Medium'
             else 'Well'
        end "Department Grade Salary"
from employees
group by department_id;

--문제 2
-- 입사일이 2005년 이전인 사원 -> job_id에 MGR 포함 -> 급여 15%인상
--                            -> job_id에 MAN 포함 -> 급여 20%인상
--   입사일이 2005년 부터인 사원 -> job_id에 MGR 포함 -> 급여 25%인상
-- 단 해당되는 사원들만 출력
select employee_id,first_name||' '||last_name "Name",job_id,hire_date,salary
      ,case when hire_date < '20050101'
            then 
                case when job_id like '%MGR%'
                     then salary*1.15
                     else salary*1.20
                end
            else salary*1.25
        end "Department Grade Salary"
from employees
where hire_date < '20050101' and (job_id like '%MGR%' or job_id LIKE '%MAN%') or  hire_date >= '20050101' and job_id like '%MGR%';

--문제 3
-- 방식1
-- 월 별로 입사한 사원 수가 각 행 별로 출력되도록 하시오
select count(decode(to_char(hire_date,'mm'),'01',1,null)) as "1 Month",
       count(decode(to_char(hire_date,'mm'),'02',2,null)) as "2 Month",
       count(decode(to_char(hire_date,'mm'),'03',3,null)) as "3 Month",
       count(decode(to_char(hire_date,'mm'),'04',4,null)) as "4 Month",
       count(decode(to_char(hire_date,'mm'),'05',5,null)) as "5 Month",
       count(decode(to_char(hire_date,'mm'),'06',6,null)) as "6 Month",
       count(decode(to_char(hire_date,'mm'),'07',7,null)) as "7 Month",
       count(decode(to_char(hire_date,'mm'),'08',8,null)) as "8 Month",
       count(decode(to_char(hire_date,'mm'),'09',9,null)) as "9 Month",
       count(decode(to_char(hire_date,'mm'),'10',10,null)) as "10 Month",
       count(decode(to_char(hire_date,'mm'),'11',11,null)) as "11 Month",
       count(decode(to_char(hire_date,'mm'),'12',12,null)) as "12 Month"
from employees
group by to_char(hire_date,'mm')
order by to_char(hire_date,'mm');
-- 방식2
-- 첫 행에 모든 월별 입사 사원 수가 출력되도록 하시오
select count(decode(to_char(hire_date,'mm'),'01',1,null)) as "1 Month",
       count(decode(to_char(hire_date,'mm'),'02',2,null)) as "2 Month",
       count(decode(to_char(hire_date,'mm'),'03',3,null)) as "3 Month",
       count(decode(to_char(hire_date,'mm'),'04',4,null)) as "4 Month",
       count(decode(to_char(hire_date,'mm'),'05',5,null)) as "5 Month",
       count(decode(to_char(hire_date,'mm'),'06',6,null)) as "6 Month",
       count(decode(to_char(hire_date,'mm'),'07',7,null)) as "7 Month",
       count(decode(to_char(hire_date,'mm'),'08',8,null)) as "8 Month",
       count(decode(to_char(hire_date,'mm'),'09',9,null)) as "9 Month",
       count(decode(to_char(hire_date,'mm'),'10',10,null)) as "10 Month",
       count(decode(to_char(hire_date,'mm'),'11',11,null)) as "11 Month",
       count(decode(to_char(hire_date,'mm'),'12',12,null)) as "12 Month"
from employees;
-- 방식3
-- 년도,달별로 입사 인원 수 출력
select to_char(hire_date,'yyyy') as year,
       count(decode(to_char(hire_date,'mm'),'01',1,null)) as "1 Month",
       count(decode(to_char(hire_date,'mm'),'02',2,null)) as "2 Month",
       count(decode(to_char(hire_date,'mm'),'03',3,null)) as "3 Month",
       count(decode(to_char(hire_date,'mm'),'04',4,null)) as "4 Month",
       count(decode(to_char(hire_date,'mm'),'05',5,null)) as "5 Month",
       count(decode(to_char(hire_date,'mm'),'06',6,null)) as "6 Month",
       count(decode(to_char(hire_date,'mm'),'07',7,null)) as "7 Month",
       count(decode(to_char(hire_date,'mm'),'08',8,null)) as "8 Month",
       count(decode(to_char(hire_date,'mm'),'09',9,null)) as "9 Month",
       count(decode(to_char(hire_date,'mm'),'10',10,null)) as "10 Month",
       count(decode(to_char(hire_date,'mm'),'11',11,null)) as "11 Month",
       count(decode(to_char(hire_date,'mm'),'12',12,null)) as "12 Month"
from employees
group by to_char(hire_date,'yyyy')
order by year;