using EmplyeeLeaveTrackerService as service from '../../srv/EmplyeeLeaveTracker-service';

annotate service.Employee with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'LWD',
            Value : LWD,
        },
        {
            $Type : 'UI.DataField',
            Value : empNumber,
            Label : 'EmpNumber',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Salary',
            Value : salary,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : city.cityname,
            Label : 'City',
        },
        {
            $Type : 'UI.DataField',
            Value : state.name,
            Label : 'State',
        },
    ]
);
annotate service.Employee with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LWD',
                Value : LWD,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Salary',
                Value : salary,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'phone',
                Value : phone,
            },
            {
                $Type : 'UI.DataField',
                Value : city.cityname,
                Label : 'City Name',
            },
            {
                $Type : 'UI.DataField',
                Value : state.name,
                Label : 'State Name',
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
            Label : 'Leaves',
            ID : 'Leaves',
            Target : 'leaves/@UI.LineItem#Leaves',
        },
    ]
);
annotate service.Leaves with @(
    UI.LineItem #Leaves : [
        {
            $Type : 'UI.DataField',
            Value : date,
            Label : 'date',
        },{
            $Type : 'UI.DataField',
            Value : days,
            Label : 'days',
        },{
            $Type : 'UI.DataField',
            Value : employee_empid,
            Label : 'employee_empid',
        },{
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },]
);
annotate service.Employee with @(
    UI.FieldGroup #State : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : state.name,
                Label : 'name',
            },],
    }
);
annotate service.Employee with @(
    UI.FieldGroup #Ci : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Employee with @(
    UI.FieldGroup #City : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : city.cityname,
                Label : 'City Name',
            },],
    }
);

annotate service.City with {
    cityname @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'City',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : cityname,
                    ValueListProperty : 'cityname',
                },
               {
                 $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'cityid',
                    LocalDataProperty : state_stateid,
                },
               // {
                 //   $Type : 'Common.ValueListParameterInOut',
                   // ValueListProperty : 'state/stateid',
                    //LocalDataProperty : cityid,
                //},
            ],
        Label : 'City',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Employee with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Initials : empNumber,
    }
);
annotate service.Employee with {
    city @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'City',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : city_cityid,
                    ValueListProperty : 'cityid',
                },                               
            ],
        Label : 'City',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Employee with {
    state @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'State',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_stateid,
                    ValueListProperty : 'stateid',
                },
            ],
        Label : 'State',
        },
        Common.ValueListWithFixedValues : true
)};

//annotate service.State with {
    //name @UI.MultiLineText : false
//};
annotate service.State with {
    name @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'State',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
        Label : 'State',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.City with {
    cityname @Common.Text : state.name
};

