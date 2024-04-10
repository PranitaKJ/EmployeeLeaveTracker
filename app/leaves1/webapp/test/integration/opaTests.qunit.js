sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ee/demo/leaves1/test/integration/FirstJourney',
		'ee/demo/leaves1/test/integration/pages/LeavesList',
		'ee/demo/leaves1/test/integration/pages/LeavesObjectPage'
    ],
    function(JourneyRunner, opaJourney, LeavesList, LeavesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ee/demo/leaves1') + '/index.html'
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