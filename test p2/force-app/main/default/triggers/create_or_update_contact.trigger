trigger create_or_update_contact on LiveChatTranscript (after insert) {
    System.debug('Hiiii');
    for(LiveChatTranscript cas : trigger.new)
    {
        System.debug('Hiiii');
        if(cas.ContactId <> NULL){
            List<Contact> existingContacts = new List<Contact>([Select AccountId,Name from Contact where Email= :cas.Contact.Email]);
            System.debug(existingContacts);
            System.debug('Hiiii');
        }
    }
}