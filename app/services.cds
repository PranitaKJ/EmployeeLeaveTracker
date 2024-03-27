using from './employee/annotations';

using from './leaves/annotations';

entity Entity1
{
    key ID : UUID;
}
annotate EmplyeeLeaveTrackerService.Employee with @(
    UI.SelectionFields : [
        city_cityid,
        state_stateid,
    ]
);

annotate EmplyeeLeaveTrackerService.Leaves with @(
    UI.SelectionFields : [
        employee_ID,
        date,
    ]
);


annotate EmplyeeLeaveTrackerService.City with @(
    UI.SelectionFields : [
        state.name,
    ]
);

