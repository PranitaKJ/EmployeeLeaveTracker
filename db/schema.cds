namespace sap.capire.employeeleavetracker;

using { cuid } from '@sap/cds/common';

entity Employee : cuid
{  
    empNumber : String(20);
    name : String(100);
    LWD : Date;
    salary : Double;
    email : String(100);
    phone : String(20);
    state : Association to one State;
    city : Association to one City;
    leaves : Composition of many Leaves on leaves.employee = $self;
}

entity Leaves : cuid
{
    //key id : String(20);
    date : Date;
    days : Integer;
    employee : Association to one Employee;
    expenses : Composition of many Expenses on expenses.leaves = $self;
}
entity Expenses : cuid
{
    description  : String(50);
    amount : Integer;
    leaves : Association to one Leaves;
}
entity State
{
    key stateid : String(20);
    name : String(50);
    empCount : Integer default 0;
    city : Association to many City on city.state = $self;
    employee : Association to many Employee on employee.state = $self;
}

entity City
{
    key cityid : String(20);
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
