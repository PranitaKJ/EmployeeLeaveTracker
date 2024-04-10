using { sap.capire.employeeleavetracker as db } from '../db/schema';
service EmplyeeLeaveTrackerService {
      @odata.draft.enabled
    entity Employee as projection on db.Employee ;
   // @odata.draft.enabled
   entity Leaves as projection on db.Leaves;
   //@odata.draft.enabled
   entity Expenses as projection on db.Expenses;
    @odata.draft.enabled
    entity City as projection on db.City;
    @odata.draft.enabled
    entity State as projection on db.State;
    entity EmployeeNumberUniqueCode as projection on db.EmployeeNumberUniqueCode
}