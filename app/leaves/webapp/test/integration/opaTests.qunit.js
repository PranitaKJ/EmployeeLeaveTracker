sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/el/demo/leaves/test/integration/FirstJourney',
		'sap/el/demo/leaves/test/integration/pages/LeavesList',
		'sap/el/demo/leaves/test/integration/pages/LeavesObjectPage'
    ],
    function(JourneyRunner, opaJourney, LeavesList, LeavesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/el/demo/leaves') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLeavesList: LeavesList,
					onTheLeavesObjectPage: LeavesObjectPage
                }
            },
            opaJourney.run
        );
    }
);