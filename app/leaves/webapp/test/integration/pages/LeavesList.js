sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'sap.el.demo.leaves',
            componentId: 'LeavesList',
            contextPath: '/Leaves'
        },
        CustomPageDefinitions
    );
});