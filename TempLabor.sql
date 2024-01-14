/*
INSTRUCTIONS:
To use this script, use the Import Wizard to import EmployeeRates.csv and the 
newly created invoiceinfo.csv. 
*/
-- ------------------------------------------------------ --

-- ensure that you are using the correct database...
drop database if exists newdb;
create database newdb;
use newdb;

-- ------------------------------------------------------ --

-- created to store invoice information
drop table if exists TempLabor;
create table TempLabor (
    LaborEmployee varchar(30),
    Department varchar(100),
    RegHours decimal(4,2),
    OTHours decimal(4,2)
);

insert into TempLabor select * from invoiceinfo;

select * from TempLabor;

-- ------------------------------------------------------ --

-- created to store employee rate information
drop table if exists TempRates;
create table TempRates (
	RateEmployee varchar(30),
    RegRate decimal(4,2),
    OTRate decimal(4,2)
);

insert into TempRates
select Name, RegRate, RegRate * 1.5 as OTRate
from EmployeeRates;

select * from TempRates;

-- ------------------------------------------------------ --

-- created to join invoice and employee rate information 
drop table if exists result;
create table result as (
	select * from TempLabor
	join TempRates on trim(LaborEmployee) = trim(RateEmployee)
    );

select * from result;

-- ------------------------------------------------------ --

-- the below queries can be selected and ran to provide analytical insight for each invoice

-- those who have worked overtime:
select LaborEmployee, OTHours from TempLabor where OTHours > 0;

-- those with less than 40 hours:
select LaborEmployee, RegHours from TempLabor where RegHours < 40;

-- those who made less than $800:
select LaborEmployee, ((RegHours * RegRate) + (OTHours * OTRate)) as Pay
from result
where ((RegHours * RegRate) + (OTHours * OTRate)) < 800;

-- particular dept (in this case, Receiving):
select distinct Department from TempLabor;
select LaborEmployee, Department from TempLabor where Department like '%Receiving%'; -- NOTE: %Receiving% can be changed to filter out other information as needed.

-- Total hours worked by department
select Department, sum(RegHours) as SumReg, sum(OTHours) as SumOT
from TempLabor 
group by Department;
