sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'logaligroup/order/test/integration/FirstJourney',
		'logaligroup/order/test/integration/pages/HeadersList',
		'logaligroup/order/test/integration/pages/HeadersObjectPage',
		'logaligroup/order/test/integration/pages/ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeadersList, HeadersObjectPage, ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('logaligroup/order') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeadersList: HeadersList,
					onTheHeadersObjectPage: HeadersObjectPage,
					onTheItemsObjectPage: ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);