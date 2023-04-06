import { LightningElement, api } from 'lwc';

export default class PriPubDemo extends LightningElement {
    message = "Public property";
    @api recordId;
}