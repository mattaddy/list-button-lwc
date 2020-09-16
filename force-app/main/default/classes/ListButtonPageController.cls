public with sharing class ListButtonPageController {
    private ApexPages.StandardSetController controller;

    public ListButtonPageController(ApexPages.StandardSetController controller) {
        this.controller = controller;
    }

    public String getSelected() {
        return JSON.serialize(this.controller.getSelected());
    }

    public String getSelectedIds() {
        Set<Id> recordIds = new Set<Id>();
        for (SObject record : this.controller.getSelected()) {
            recordIds.add(record.Id);
        }
        return JSON.serialize(recordIds);
    }
}
