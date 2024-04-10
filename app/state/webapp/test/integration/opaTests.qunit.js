sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/ee/demo/state/test/integration/FirstJourney',
		'sap/ee/demo/state/test/integration/pages/StateList',
		'sap/ee/demo/state/test/integration/pages/StateObjectPage',
		'sap/ee/demo/state/test/integration/pages/CityObjectPage'
    ],
    function(JourneyRunner, opaJourney, StateList, StateObjectPage, CityObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/ee/demo/state') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStateList: StateList,
					onTheStateObjectPage: StateObjectPage,
					onTheCityObjectPage: CityObjectPage
                }
            },
            opaJourney.run
        );
    }
);