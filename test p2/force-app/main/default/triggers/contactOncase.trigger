trigger contactOncase on Case (before insert, before update) {

    for(Case cas: Trigger.New)
    {
        if(cas.SuppliedEmail <> NULL){ 
        List<Contact> mynew= [Select AccountId,Name from Contact where /*id= :cas.ContactId or*/ Email= :cas.SuppliedEmail /*or Phone= :cas.Phone_Number__c*/];
        //List<Account> mynew= [Select Name from Account where Email__c= :cas.Email__c and Phone= :cas.Phone_Number__c/*or Email__c= :cas.Email__c or Phone= :cas.Phone_Number__c*/]; 
         System.debug(mynew.size());
            if(mynew.size()>0 ){                //System.debug(mynew);
               cas.ContactId = mynew[0].id;
               //cas.AccountId=mynew[0].AccountId;

        }else{
            /*cas.ContactId = Null;
               cas.AccountId=Null;*/
            Contact con = new Contact(
        FirstName='',
        LastName=cas.SuppliedName,
        Email=cas.SuppliedEmail,
        Phone=cas.SuppliedPhone);
            insert con;
            system.debug(con);
            cas.ContactId = con.Id;
        }
        }else{
            cas.ContactId = Null;
               cas.AccountId=Null;
        }
}
}