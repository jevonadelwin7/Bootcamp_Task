create table regions(
	region_id serial primary key,
	region_name varchar(25)
);
create table countries(
	country_id varchar(2) primary key,
	country_name varchar(40),
	region_id integer not null,
	foreign key(region_id) references regions(region_id) on update cascade on delete cascade
);	


create table locations(
	location_id serial primary key,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30) not null,
	state_province varchar(25),
	country_id varchar(2) not null,
	foreign key(country_id) references countries(country_id) on update cascade on delete cascade
);

create table jobs(
	job_id serial primary key,
	job_title varchar(25),
	min_salary varchar(20),
	max_salary varchar(20)
);

create table departments(
	department_id serial primary key,
	department_name varchar(25),
	location_id varchar(4) not null,
	foreign key(location_id) references locations(location_id) on update cascade on delete cascade
);
alter table employees alter column hire_date type date
create table employees(
	employee_id serial primary key,
	first_name varchar(20),
	last_name varchar(25) not null,
	email varchar(100),
	phone_number varchar(20),
	hire_date date not null,
	job_id integer not null,
	salary numeric(8,2) not null,
	manager_id integer,
	department_id integer not null,
	foreign key(department_id) references departments(department_id) on update cascade on delete cascade
);

create table dependents(
	dependent_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	relationship varchar(25)not null,
	employee_id integer not null,
	foreign key(employee_id) references employees(employee_id) on update cascade on delete cascade
);


create table projects(
	proj_id serial primary key,
	proj_name varchar(100),
	proj_createon date,
	proj_duedate date,
	proj_cust_name varchar(100)
);

/*1. Buat sintak untuk create table yang memiliki relasi many to many antara table employees dan 
table projects.*/
create table project_assignment(
	pras_proj_id integer,
	pras_employee_id integer,
	pras_startdate date,
	pras_enddate date,
	pras_status varchar(15),
	CONSTRAINT project_assignment_pk PRIMARY KEY (pras_proj_id,pras_employee_id)
);

/*
2.Buat sintak untuk menambahkan kolom berikut di table projects 
• proj_description varchar(255) 
• proj_status varchar(15) 
• proj_amount number
*/
alter table projects add column proj_description varchar(255)
alter table projects add column proj_status varchar(15) 
alter table projects add column proj_amount integer

/*
3. Buat sintak untuk menambahkan kolom proj_account_mgr dengan tipe data integer dan buat 
juga constraint foreign key antara table projects dan employees.
*/
alter table projects add column proj_account_mgr integer
alter table projects add constraint projects_employees_id_fk foreign key (proj_account_mgr) references employees(employee_id )

/*
4. Buat sintak insert ke table projects minimal 3 record, kolom proj_account_mgr hanya bisa diisi 
value oleh employee yang memiliki jabatan manager. 
*/

insert into  projects (proj_id,proj_name,proj_createon,proj_duedate,proj_cust_name,proj_description,proj_status) 
values (1,'E-COMMERCE','2021-09-14','2021-12-13','TELKOMSEL',NULL,'INPROGRESS');
insert into  projects (proj_id,proj_name,proj_createon,proj_duedate,proj_cust_name,proj_description,proj_status) 
values (2,'TRAVELOKA','2021-09-14','2021-12-13','XL',NULL,'INPROGRESS');
insert into  projects (proj_id,proj_name,proj_createon,proj_duedate,proj_cust_name,proj_description,proj_status) 
values (3,'TIKET.COM','2021-09-14','2021-12-13','INDOSAT',NULL,'INPROGRESS');

/*
5.Buat sintak insert ke table project_assignment dengan value seperti di table, dengan employee 
yang ada di department IT. 
*/

insert into  project_assignment (pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) 
values (1, 104,'2021-09-14',NULL,'ASSIGNED');
insert into  project_assignment (pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) 
values (1, 105,'2021-09-14','2021-09-17','COMPLETED');
insert into project_assignment (pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) 
values (1, 106,'2021-09-14',NULL,'INPROGRESS');
insert into  project_assignment (pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) 
values (2, 104,'2021-09-14',NULL,'ASSIGNED');
insert into  project_assignment (pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) 
values (2, 105,'2021-09-14','2021-09-17','COMPLETED');
insert into  project_assignment (pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) 
values (2, 106,'2021-09-14','2021-09-17','INPROGRESS');

/*
6. Tampilkan employee yang pras_status nya sudah completed di tiap project.. 
*/


SELECT employee_id,first_name,pras_status
FROM employees
FULL OUTER JOIN project_assignment
ON project_assignment.pras_employee_id = employees.employee_id
WHERE pras_status = 'COMPLETED'; 