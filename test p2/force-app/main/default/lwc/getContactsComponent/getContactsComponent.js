import { LightningElement, api, wire } from 'lwc';
import GetContact from '@salesforce/apex/ContactController1.GetContacts';

import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';

export default class GetContactsComponent extends LightningElement {
    @api recordId;
    @wire(GetContact, { accId: '$recordId' })
    Contacts;

    get name() {
        return this.Contacts.data.fields.FirstName.Value;
    }
    get Id() {
        return this.Contacts.data.fields.Id.Value;
    }
}