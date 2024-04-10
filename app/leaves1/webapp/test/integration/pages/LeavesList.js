sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ee.demo.leaves1',
            componentId: 'LeavesList',
            contextPath: '/Leaves'
        },
        CustomPageDefinitions
    );
});