sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/el/demo/employee/test/integration/FirstJourney',
		'sap/el/demo/employee/test/integration/pages/EmployeeList',
		'sap/el/demo/employee/test/integration/pages/EmployeeObjectPage',
		'sap/el/demo/employee/test/integration/pages/LeavesObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeeList, EmployeeObjectPage, LeavesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/el/demo/employee') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeeList: EmployeeList,
					onTheEmployeeObjectPage: EmployeeObjectPage,
					onTheLeavesObjectPage: LeavesObjectPage
                }
            },
            opaJourney.run
        );
    }
);