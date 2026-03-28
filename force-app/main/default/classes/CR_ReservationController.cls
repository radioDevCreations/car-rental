public with sharing class CR_ReservationController {
    @AuraEnabled
    public static List<CR_Reservation__c> getMyReservations(){
        return CR_ReservationsSelector.getReservationsByUserId(CR_TransactionStaticData.getCurrentUserId());
    }
}