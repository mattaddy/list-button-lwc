@IsTest
private class ListButtonPageControllerTest {
    @TestSetup
    private static void setup() {
        insert new List<Account> { 
                new Account(Name = 'Burlington Textiles Corp.'),
                new Account(Name = 'Widgets Inc.'),
                new Account(Name = 'Edge Communications')
        };
    }

    @IsTest
    private static void getSelected_expectSetControllerSelected() {
        List<Account> records = [SELECT Id FROM Account];

        Test.startTest();
        ApexPages.StandardSetController setController = new ApexPages.StandardSetController(records);
        setController.setSelected(records);
        
        ListButtonPageController controller = new ListButtonPageController(setController);

        String selectedRecords = controller.getSelected();
        Test.stopTest();

        System.assertEquals(JSON.serialize(setController.getSelected()), selectedRecords);
    }

    @IsTest
    private static void getSelectedIds_expectSetControllerSelectedIds() {
        List<Account> records = [SELECT Id FROM Account];

        Test.startTest();
        ApexPages.StandardSetController setController = new ApexPages.StandardSetController(records);
        setController.setSelected(records);
        
        ListButtonPageController controller = new ListButtonPageController(setController);

        String selectedRecordIds = controller.getSelectedIds();
        Test.stopTest();

        Set<Id> recordIds = new Set<Id>();
        for (SObject record : setController.getSelected()) {
            recordIds.add(record.Id);
        }

        System.assertEquals(JSON.serialize(recordIds), selectedRecordIds);
    }
}
