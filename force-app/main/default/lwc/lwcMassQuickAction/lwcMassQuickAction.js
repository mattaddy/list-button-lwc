import { api, LightningElement } from 'lwc';

export default class LwcMassQuickAction extends LightningElement {
  @api records;
  @api recordIds;
}
