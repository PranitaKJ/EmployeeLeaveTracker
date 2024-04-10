sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/ee/demo/employee1/test/integration/FirstJourney',
		'sap/ee/demo/employee1/test/integration/pages/EmployeeList',
		'sap/ee/demo/employee1/test/integration/pages/EmployeeObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeeList, EmployeeObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/ee/demo/employee1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeeList: EmployeeList,
					onTheEmployeeObjectPage: EmployeeObjectPage
                }
            },
            opaJourney.run
        );
    }
);