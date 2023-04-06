public with sharing class ContactController1 {
    @AuraEnabled(cacheable=true)
    public static List<Contact> GetContacts(String accId){
        try {
            return[
                SELECT AccountId, Id, FirstName
                FROM Contact
                WHERE AccountId =:accId 
                WITH SECURITY_ENFORCED
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}