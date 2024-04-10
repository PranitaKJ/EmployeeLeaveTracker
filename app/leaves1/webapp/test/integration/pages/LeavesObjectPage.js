sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ee.demo.leaves1',
            componentId: 'LeavesObjectPage',
            contextPath: '/Leaves'
        },
        CustomPageDefinitions
    );
});