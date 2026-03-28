public with sharing class CR_ReservationsSelector {
    public static List<CR_Reservation__c> getReservationsByIds(Set<Id> reservationIds) {
        return [SELECT Id, Name, StartTime__c, EndTime__c, Vehicle__c, User__c FROM CR_Reservation__c WHERE Id IN :reservationIds];
    }

    public static CR_Reservation__c getReservationById(Id reservationId){
        Set<Id> reservationIds = new Set<Id>{reservationId};
        return getReservationsByIds(reservationIds)[0];
    }

    public static List<CR_Reservation__c> getReservationsByUserId(Id userId){
        return [SELECT Id, Name, StartTime__c, EndTime__c, Vehicle__c, User__c  FROM CR_Reservation__c WHERE User__c = :userId];
    }
}