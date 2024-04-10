using EmplyeeLeaveTrackerService as service from '../../srv/EmplyeeLeaveTracker-service';

annotate service.Employee with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'empNumber',
            Value : empNumber,
        },
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
            Label : 'salary',
            Value : salary,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : city.cityname,
            Label : 'cityname',
        },
        {
            $Type : 'UI.DataField',
            Value : state.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : city_cityid,
        },
    ]
);
annotate service.Employee with {
    state @Common.ValueList : {
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
    }
};
annotate service.Employee with {
    city @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'City',
        Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : city_cityid,
                    ValueListProperty : 'cityid',
                },
                {
                    $Type : 'Common.ValueListParameterInOut',
                    ValueListProperty : 'state/stateid',
                    LocalDataProperty : state_stateid,
                },
            ],
        Label : 'City',
    }
};
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
                Label : 'salary',
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
                Label : 'State',
                Value : state_stateid,
            },
            {
                $Type : 'UI.DataField',
                Value : state.name,
                Label : 'statename',
            },
            {
                $Type : 'UI.DataField',
                Label : 'City',
                Value : city_cityid,
            },
            {
                $Type : 'UI.DataField',
                Value : city.cityname,
                Label : 'cityname',
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
            Target : 'leaves/@UI.LineItem#Leaves1',
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
        },
        {
            $Type : 'UI.DataField',
            Value : id,
            Label : 'id',
        },
        ]
);

annotate service.Employee with {
    city @Common.ValueListWithFixedValues : true
};
annotate service.City with {
    cityid @Common.Text : cityname
};
annotate service.Employee with @(
    UI.SelectionFields : [
        state_stateid,
        city_cityid,
    ]
);
annotate service.Employee with {
    city @Common.Label : 'City'
};
annotate service.Employee with {
    state @Common.Label : 'State'
};
annotate service.Employee with @(
    UI.FieldGroup #L : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Employee with @(
    UI.FieldGroup #Leaves : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : leaves.date,
                Label : 'date',
            },{
                $Type : 'UI.DataField',
                Value : leaves.days,
                Label : 'days',
            },],
    }
);
annotate service.Employee with {
    state @Common.ValueListWithFixedValues : true
};
annotate service.State with {
    stateid @Common.Text : name
};
annotate service.Employee with @(
    UI.HeaderInfo : {
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : name
        },
    }
);
annotate service.Leaves with @(
    UI.LineItem #Leaves1 : [
        {
            $Type : 'UI.DataField',
            Value : date,
            Label : 'date',
        },{
            $Type : 'UI.DataField',
            Value : days,
            Label : 'days',
        },]
);
annotate service.Leaves with {
    employee @Common.FieldControl : #ReadOnly
};