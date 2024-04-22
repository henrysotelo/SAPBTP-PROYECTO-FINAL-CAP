sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'logaligroup.order',
            componentId: 'ItemsObjectPage',
            contextPath: '/Headers/to_Items'
        },
        CustomPageDefinitions
    );
});