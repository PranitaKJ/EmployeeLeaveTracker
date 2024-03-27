namespace sap.capire.employeeleavetracker;

using { cuid } from '@sap/cds/common';

entity Employee
{
    key ID : UUID;
    empNumber : String(20);
    name : String(100);
    LWD : Date;
    salary : Double;
    email : String(100);
    phone : String(20);
    leaves : Composition of many Leaves on leaves.employee = $self;
    state : Association to one State;
    city : Association to one City;
}

entity Leaves
{
    key id : UUID;
    employee : Association to one Employee;
    date : Date;
    days : Integer;
}

entity State
{
    key stateid : UUID;
    name : String(50);
    empCount : Integer default 0;
    city : Association to many City on city.state = $self;
    employee : Association to many Employee on employee.state = $self;
}

entity City
{
    key cityid : UUID;
    cityname : String(50);
    state : Association to one State;
    employee : Association to many Employee on employee.city = $self;
}

@Catalog.index :
[
    { elementNames : ['empNumber'], name : 'EmployeeNumberUniqueCodeIndex', order : #ASC, unique : true }
]
entity EmployeeNumberUniqueCode
{
    key empNumber : String;
    sequence : Integer not null default 0;
}
