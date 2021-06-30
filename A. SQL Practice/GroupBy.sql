-- 문제 1
-- 부서별 급여 합계,평균,최댓값,최솟값을 집계
-- 여섯 자리와 세 자리 구분기호, $와 함께 출력 ex) $4,400.00
-- 출력 양식 : to_char(sum(salary),'$999,999.00') 사용,부서 번호 기준 오름차순 정렬
select department_id,to_char(sum(salary),'$999,999.00'),to_char(avg(salary),'$999,999.00'),to_char(max(salary),'$999,999.00'),to_char(min(salary),'$999,999.00')
from employees
group by department_id
having department_id is not null
order by department_id;

-- 문제 2
-- 업무별 급여 평균이 $10000보다 큰 경우 조회 -> 업무,급여 평균 출력
-- 단, CLERK의 급여 평균은 제외, 급여 평균이 높은 순서대로 출력
select job_id,avg(salary) as "Avg Salary"
from employees
group by job_id
having job_id != 'CLERK' and avg(salary)>10000
order by avg(salary) desc;