-- 문제 1
--사원 수가 5명 이상인 부서의 부서명, 사원 수 출력
--사원 수 기준으로 내림차순 정렬
select department_name,count(*)
from employees emp join departments dept on emp.department_id=dept.department_id
group by department_name
having count(*)>=5
order by count(*) desc;

--문제2
--아래 테이블(job_grade,급여 등급 테이블) 생성하여 사용.
create table job_grade(grade_level varchar2(3),lowest_sal number,highest_sal number);
insert into job_grade values ('A',1000,2999);
insert into job_grade values ('B',3000,5999);
insert into job_grade values ('C',6000,9999);
insert into job_grade values ('D',10000,14999);
insert into job_grade values ('E',15000,24999);
insert into job_grade values ('F',25000,40000);
commit;
-- 각 사원의 급여에 따른 급여 등급 보고
-- 사원의 성과 이름, 업무, 부서명 ,입사일, 급여, 급여 등급을 출력
select * from job_grade;
select first_name||' '||last_name "Name", job_id,department_name,hire_date,salary,grade_level
from employees emp join departments dept on emp.department_id=dept.department_id
    join job_grade grade on emp.salary between grade.lowest_sal and grade.highest_sal;
    
-- 문제 3
-- 각 사원과 직속 상사와의 관계를 이용해 다음과 같은 형식으로 출력
-- employee : 허균, manager : 허각 -> 허균 report to 허각
-- 상사 이름은 대문자로 출력, 보고할 상사가 없는 사원도 포함해서 출력
select emp.first_name||' '||emp.last_name||' report to '|| upper(manager.first_name||' '||manager.last_name) "Employee vs Manager"
from employees emp left outer join employees manager on emp.MANAGER_ID=manager.EMPLOYEE_ID;
