public with sharing class CR_VehicleSelector {
    public static List<CR_Vehicle__c> getVehiclesByIds(Set<Id> vehicleIds) {
        return [SELECT Id, Name, Make__c, Model__c, VRN__c, VIN__c, PhotoURL__c FROM CR_Vehicle__c WHERE Id IN :vehicleIds];
    }

    public static CR_Vehicle__c getVehicleById(Id vehicleId){
        Set<Id> vehicleIds = new Set<Id>{vehicleId};
        return getVehiclesByIds(vehicleIds)[0];
    }

    public static List<CR_Vehicle__c> getAllVehicles() {
        return [SELECT Id, Name, Make__c, Model__c, VRN__c, VIN__c, PhotoURL__c FROM CR_Vehicle__c];
    }
}