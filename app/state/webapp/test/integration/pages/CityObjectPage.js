sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sap.ee.demo.state',
            componentId: 'CityObjectPage',
            contextPath: '/State/city'
        },
        CustomPageDefinitions
    );
});