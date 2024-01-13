drop database if exists Alba;
create database Alba;
use Alba;

drop table if exists TempLabor;
create table TempLabor (
    Employee varchar(30),
    Department varchar(100),
    RegHours decimal(4,2),
    OTHours decimal(4,2)
);

insert into TempLabor select * from invoiceinfo;

select * from TempLabor;

-- those who have worked overtime:
select Employee, OTHours from TempLabor where OTHours > 0;

-- those with less than 40 hours:
select Employee, RegHours from TempLabor where RegHours < 40;

-- particular dept (in this case, Receiving):
select distinct Department from TempLabor;
select Employee, Department from TempLabor where Department like '%Receiving%'; -- NOTE: %Receiving% can be changed to filter out other information as needed.

-- Total hours worked by department
select Department, sum(RegHours) as SumReg, sum(OTHours) as SumOT
from TempLabor 
group by Department;