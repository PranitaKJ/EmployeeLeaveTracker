
entity Entity1
{
    key ID : UUID;
}


annotate EmplyeeLeaveTrackerService.Leaves with @(
    UI.SelectionFields : [
      // employee_ID
       // date,
      // employee_ID,
      employee.empNumber
       
    ]
);


annotate EmplyeeLeaveTrackerService.City with @(
    UI.SelectionFields : [
        state.name,
    ]
);

//using from './employee1/annotations';
//annotate EmplyeeLeaveTrackerService.Employee with @(
 //   UI.SelectionFields : [
    //    state.stateid,
   //     city.cityid,
   // ]
//);

using from './employee1/annotations';

using from './state/annotations';

using from './leaves1/annotations';