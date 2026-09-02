public without sharing class SharingBypassDemo {

    // Paylasim kurallarini atlayan, disaridan cagrilabilir metot
    @AuraEnabled
    public static List<Opportunity> getAllOpportunities() {
        return [SELECT Id, Name, Amount, StageName FROM Opportunity];
    }

    // Nesne/alan seviyesinde yetki kontrolu yapilmiyor
    @AuraEnabled
    public static void updateAmount(Id oppId, Decimal amount) {
        Opportunity o = [SELECT Id FROM Opportunity WHERE Id = :oppId];
        o.Amount = amount;
        update o;
    }
}
