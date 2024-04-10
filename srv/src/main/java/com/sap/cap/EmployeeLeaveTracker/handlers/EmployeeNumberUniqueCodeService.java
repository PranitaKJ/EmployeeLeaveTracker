package com.sap.cap.EmployeeLeaveTracker.handlers;

import java.util.List;
import java.util.Optional;
import com.sap.cds.services.handler.EventHandler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.apache.commons.lang3.StringUtils;
import com.sap.cds.Result;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.ql.cqn.CqnUpdate;
//import com.sap.cds.ql.cqn.CqnUpsert;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CdsDeleteEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
//import com.sap.cds.services.handler.annotations.Before;
//import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import cds.gen.emplyeeleavetrackerservice.EmplyeeLeaveTrackerService_;
import cds.gen.emplyeeleavetrackerservice.State;
import cds.gen.emplyeeleavetrackerservice.State_;
import cds.gen.emplyeeleavetrackerservice.Employee;
import cds.gen.emplyeeleavetrackerservice.EmployeeNumberUniqueCode;
import cds.gen.emplyeeleavetrackerservice.EmployeeNumberUniqueCode_;
import cds.gen.emplyeeleavetrackerservice.Employee_;
import com.sap.cds.services.persistence.PersistenceService;



@Component
@ServiceName(EmplyeeLeaveTrackerService_.CDS_NAME)
public class EmployeeNumberUniqueCodeService implements EventHandler{

    @Autowired
    PersistenceService db;

    @Before(event = CqnService.EVENT_CREATE, entity = Employee_.CDS_NAME)
    public void beforeCreate(CdsCreateEventContext context, Employee view) {
        CqnSelect select = Select.from(EmployeeNumberUniqueCode_.class)
                   .orderBy(o -> o.sequence().desc()).limit(1);
 
                   Result result = db.run(select);
                   Optional<EmployeeNumberUniqueCode> optional = result.first(EmployeeNumberUniqueCode.class);
                   Integer sequence = 1;
                   if (optional.isPresent()) {
                       sequence = optional.get().getSequence() + 1;
                   }
                   String uniqueCode = StringUtils.leftPad(String.valueOf(sequence), 2, "E");

                   EmployeeNumberUniqueCode code = EmployeeNumberUniqueCode.create();
                   code.setEmpNumber(uniqueCode);
                   code.setSequence(sequence);
                   
                   view.setEmpNumber(uniqueCode);
                   

                   CqnInsert insert = Insert.into(EmployeeNumberUniqueCode_.class).entry(code);
                   db.run(insert).first(EmployeeNumberUniqueCode_.class);
                  // CqnUpsert insert = Upsert.into(EmployeeNumberUniqueCode_.class).entry(code);
                   //db.run(insert).first(EmployeeNumberUniqueCode_.class);
 
                   
    }

    @After(event = CqnService.EVENT_CREATE, entity = Employee_.CDS_NAME)
    public void afterCreate(CdsCreateEventContext context, State view) {
        CqnSelect select = Select.from(Employee_.class).orderBy(o -> o.empNumber().desc()).limit(1);
        Result result = db.run(select);
        
        Optional<Employee> optional = result.first(Employee.class);

        CqnSelect select1 = Select.from(State_.class).where(o->o.stateid().eq(optional.get().getStateStateid()));
        Result result1 = db.run(select1);
        Optional<State> optional1 = result1.first(State.class);  

        if (optional1.isPresent()) {
            State state = State.create();
            state.setEmpCount(optional1.get().getEmpCount()+1);
            state.setStateid(optional1.get().getStateid());

            CqnUpdate update = Update.entity(State_.class).entry(state);

            db.run(update);
    
        }
    
    }
//Delete
@Before(event = CqnService.EVENT_DELETE, entity = Employee_.CDS_NAME)
public void onDelete(CdsDeleteEventContext context) {
    Select<?> select = Select.from(context.getCqn().ref());
    context.getCqn().where().ifPresent(select::where);
  
    

        
       /*     CqnSelect sel = Select.from(context.getCqn().ref()).columns(e -> e.state_stateid()).where(e -> e.ID().eq(empId));
        Result result = db.run(sel);
    Optional<Employee> optional = result.first(Employee.class);  

    CqnSelect select1 = Select.from(State_.class).where(o->o.stateid().eq(optional.get().getStateStateid()));
    Result result1 = db.run(select1);
    Optional<State> optional1 = result1.first(State.class);  

    if (optional1.isPresent()) {
        State state = State.create();
        state.setEmpCount(optional1.get().getEmpCount()-1);
        state.setStateid(optional1.get().getStateid());

        CqnUpdate update = Update.entity(State_.class).entry(state);

        db.run(update);

    }*/
        
    

}
}