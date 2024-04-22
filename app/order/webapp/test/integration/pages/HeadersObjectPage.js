sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'logaligroup.order',
            componentId: 'HeadersObjectPage',
            contextPath: '/Headers'
        },
        CustomPageDefinitions
    );
});