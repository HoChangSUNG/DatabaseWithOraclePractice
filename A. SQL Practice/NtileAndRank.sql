--셈플 문제
--NTILE()을 이용하여 부서별 급여 합계 출력
-- 급여 합계 제일 큰 것 ->1, 제일 작은것 ->4로 나누고 bucket(등급)을 나누어 출력, Bucket(등급)을 기준으로 오름차순 정렬
select department_id, sum(salary),ntile(4) over(order by sum(salary) desc) as "Bucket#"
from employees
group by department_id
order by 3;

--문제1
-- 각 사원이 소속된 부서별로 급여를 기준으로 내림차순으로 정렬
-- rank(),dense_rank(),row_number() 이용
select employee_id,last_name,salary,department_id
    ,rank() over(PARTITION by department_id order by salary desc) "Rank"
    ,dense_rank() over(partition by department_id order by salary desc) "Dense_Rank"
    ,row_number() over(partition by department_id order by salary desc) "Row_Number"
from employees
order by department_id ,salary desc;

-- 문제2
-- 50번 부서의 사원 정보를 급여 순으로 내림차순 정렬하고 이전,다음 행의 급여를 함께 출력
-- LAG().LEAD()함수 사용
select employee_id,last_name,salary
    ,nvl(lead(salary) over(order by salary ),0) "Prev_Sal"
    ,nvl(lag(salary) over(order by salary ),0) "Next_sal"
from employees
where department_id=50
order by salary desc;

--문제3
-- 소속된 부서별로 급여를 가장 많이 받거나(Max_Emp_name) 가장 적게 받는(Min_Emp_name) 사원의 이름 출력
select department_id,count(*)
        ,min(last_name) keep (dense_rank first order by salary desc ) "Max_Emp_name"
        ,min(last_name) keep (dense_rank last order by salary desc) "Min_Emp_name"
from employees
group by department_id
order by department_id;