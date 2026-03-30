public with sharing class CR_VehicleController {
    @AuraEnabled
    public static List<CR_Vehicle__c> getVehicles(){
        return CR_VehicleSelector.getVehicles();
    }
}