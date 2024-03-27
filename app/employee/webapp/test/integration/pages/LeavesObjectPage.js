sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sap.el.demo.employee',
            componentId: 'LeavesObjectPage',
            contextPath: '/Employee/leaves'
        },
        CustomPageDefinitions
    );
});