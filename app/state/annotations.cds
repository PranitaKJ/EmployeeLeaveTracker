using EmplyeeLeaveTrackerService as service from '../../srv/EmplyeeLeaveTracker-service';

annotate service.State with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'stateid',
            Value : stateid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'empCount',
            Value : empCount,
        },
    ]
);
annotate service.State with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'stateid',
                Value : stateid,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'empCount',
                Value : empCount,
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
    ]
);
