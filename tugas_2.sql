/*SOAL 1*/
Select a.region_id, a.region_name, b.country_id, b.country_name
from regions a join countries b
on a.region_id = b.region_id
where region_name = 'Europe';

/*SOAL 2*/

Select b.region_id ,b.region_name, count(a.country_id) AS total_countries
from countries a join regions b
on b.region_id = a.region_id
group by b.region_id
Order by b.region_id ASC

/*SOAL 3 */

SELECT b.country_id,b.country_name,c.location_id, c.street_address,c.postal_code,c.city,c.state_province 
FROM regions a JOIN countries b 
ON a.region_id = b.region_id JOIN locations c 
ON b.country_id = c.country_id
where region_name = 'Europe'
Order by b.country_id ASC;

/*SOAL 4 */
Select a.department_id, a.department_name, b.location_id
from departments a join locations b
on a.location_id = b.location_id JOIN countries c 
on b.country_id = c.country_id
where region_id = 2;

/*SOAL 5 */
Select d.region_name, count(a.department_id) AS total_department
from departments a join locations b
on a.location_id = b.location_id JOIN countries c 
on b.country_id = c.country_id JOIN regions d
on c.region_id = d.region_id
group by d.region_id;

/*SOAL 6 */
Select c.country_name, count(a.department_id) AS total_department
from departments a join locations b
on a.location_id = b.location_id JOIN countries c 
on b.country_id = c.country_id JOIN regions d
on c.region_id = d.region_id
group by c.country_name
Order by c.country_name ASC;


/*SOAL 7 */

Select c.country_name, count(a.department_id) AS total_department
from departments a join locations b
on a.location_id = b.location_id JOIN countries c 
on b.country_id = c.country_id JOIN regions d
on c.region_id = d.region_id
group by c.country_name
Order by c.country_name DESC
LIMIT 1;

/*SOAL 8 */

Select b.department_id ,b.department_name, count(a.employee_id) AS total_emps
from employees a join departments b
on b.department_id = a.department_id
group by b.department_id
Order by total_emps ASC

/*SOAL 9 */
Select b.department_id ,b.department_name ,count(a.employee_id) AS total_emps
from employees a join departments b
on a.department_id = b.department_id JOIN locations c 
on b.location_id = c.location_id JOIN countries d	
on c.country_id = d.country_id JOIN regions e	
on d.region_id = e.region_id
where e.region_name = 'Americas'
group by b.department_id


/*SOAL 10*/

select employee_id, first_name, last_name, salary, extract(year from age(now(),hire_date)) AS massa_kerja,
CASE WHEN (extract(year from age(now(),hire_date))) >= 25 THEN (salary*5)
    ELSE (salary*3)
END AS bonus	
from employees;

/*SOAL 11*/
select  extract(year from age(now(),hire_date)) AS massa_kerja,
CASE WHEN (extract(year from age(now(),hire_date))) >= 25 THEN (salary*5)
    ELSE (salary*3)
END AS bonus_per_massanya	
from employees
Order by hire_date DESC

/*SOAL 12
select  extract(year from age(now(),hire_date)) AS massa_kerja,
CASE WHEN (extract(year from age(now(),hire_date))) >= 25 THEN (salary*5)
    ELSE (salary*3)
END AS diantara15sampai25
from employees*/

/*SOAL 13*/











