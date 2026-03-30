import { LightningElement, api } from 'lwc';

export default class CrVehicleCard extends LightningElement {
    @api vehicle;

    handleClickRent() {
        this.dispatchEvent(new CustomEvent('rent', { detail: this.vehicle }));
    }
}