-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary 
from employees e join employee_salary es 
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary
from employees e join employee_salary es 
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select employee_name, monthly_salary 
from employees e right join employee_salary es
on e.id = es.employee_id
join salary s 
on es.salary_id = s.id
where employee_name is null;


-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select employee_name, monthly_salary
from employees e right join employee_salary es
on e.id = es.employee_id 
join salary s 
on es.salary_id = s.id 
where employee_name is null and monthly_salary < 2000;

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s 
on es.salary_id = s.id 
where monthly_salary is null;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name
from employees e left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id;

-- 7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% java %';

-- 8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% python %';

-- 9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %';

-- 10. ������� ����� � ��������� ������ QA ���������.
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %' and lower(role_name) like '% manual %';

-- 11. ������� ����� � ��������� ��������������� QA
select employee_name, role_name
from employees e join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id 
where lower(role_name) like '% qa %' and lower(role_name) like '% auto%';

-- 12. ������� ����� � �������� Junior ������������
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 'junior %';

-- 13. ������� ����� � �������� Middle ������������
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 'middle %';

-- 14. ������� ����� � �������� Senior ������������
select employee_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id 
where lower(role_name) like 's %';

-- 15. ������� �������� Java �������������
select monthly_salary, role_name
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '% java %';

-- 16. ������� �������� Python �������������
select monthly_salary, role_name
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '% python %';

-- 17. ������� ����� � �������� Junior Python �������������
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior python%';

-- 18. ������� ����� � �������� Middle JS �������������
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%middle javascript%';

-- 19. ������� ����� � �������� Senior Java �������������
select employee_name, monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%senior java%';

-- 20. ������� �������� Junior QA ���������
select monthly_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior%' and lower(role_name) like'%qa%';

-- 21. ������� ������� �������� ���� Junior ������������
select round(avg(monthly_salary), 2) as average_junior_salary
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%junior%';

-- 22. ������� ����� ������� JS �������������
select sum(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%javascript%';

-- 23. ������� ����������� �� QA ���������
select min(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 24. ������� ������������ �� QA ���������
select max(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
join employees e 
on es.employee_id = e.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 25. ������� ���������� QA ���������
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%qa%';

-- 26. ������� ���������� Middle ������������.
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%middle%';

-- 27. ������� ���������� �������������
select count(role_name)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%dev%';

-- 28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary)
from salary s join employee_salary es 
on s.id = es.salary_id 
full join employees e 
on es.employee_id = e.id 
full join roles_employee re 
on e.id = re.employee_id 
full join roles r 
on re.role_id = r.id
where lower(role_name) like '%dev%';

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
left join salary s
on es.salary_id = s.id 
left join roles_employee re 
on e.id = re.employee_id 
left join roles r
on re.role_id = r.id
order by 3;

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary >= 1700 and monthly_salary < 2300
order by 3;

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary >= 1700 and monthly_salary < 2300
order by 3;

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from employees e left join employee_salary es 
on e.id = es.employee_id 
join salary s
on es.salary_id = s.id 
join roles_employee re 
on e.id = re.employee_id 
join roles r
on re.role_id = r.id
where monthly_salary in (1100, 1500, 2000)
order by 3;