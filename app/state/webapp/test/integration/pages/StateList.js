sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'sap.ee.demo.state',
            componentId: 'StateList',
            contextPath: '/State'
        },
        CustomPageDefinitions
    );
});