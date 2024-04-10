using EmplyeeLeaveTrackerService as service from '../../srv/EmplyeeLeaveTracker-service';
using from '../../db/schema';

annotate service.Leaves with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : employee.empNumber,
            Label : 'empNumber',
        },
        {
            $Type : 'UI.DataField',
            Value : employee.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Label : 'date',
            Value : date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'days',
            Value : days,
        },
    ]
);
annotate service.Leaves with {
    employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employee',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employee_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'empNumber',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'LWD',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'salary',
            },
        ],
    }
};
annotate service.Leaves with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
           // {
            //    $Type : 'UI.DataField',
              //  Value : employee.empNumber,
              //  Label : 'empNumber',
            //},
            //{
             //   $Type : 'UI.DataField',
              //  Value : employee.name,
              //  Label : 'name',
           // },
            {
                $Type : 'UI.DataField',
                Label : 'date',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'days',
                Value : days,
            },
            {
                $Type : 'UI.DataField',
                Value : employee.empNumber,
                Label : 'empNumber',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Expenses',
            ID : 'Expenses',
            Target : 'expenses/@UI.LineItem#Expenses',
        },
    ]
);
annotate service.Leaves with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : employee.empNumber,
        },
        TypeName : '',
        TypeNamePlural : '',
    }
);

annotate service.Expenses with @(
    UI.LineItem #Expenses : [
        {
            $Type : 'UI.DataField',
            Value : amount,
            Label : 'amount',
        },{
            $Type : 'UI.DataField',
            Value : description,
            Label : 'description',
        },]
);
annotate service.Employee with {
    empNumber @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Employee',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : empNumber,
                    ValueListProperty : 'empNumber',
                },
            ],
            Label : 'EmpNumber',
        },
        Common.ValueListWithFixedValues : true
)};
