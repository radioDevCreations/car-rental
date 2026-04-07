import { LightningElement, track } from 'lwc';
import getVehicles from '@salesforce/apex/CR_VehicleController.getVehicles';

export default class CrVehiclesBoard extends LightningElement {
    @track vehicles = [];

    connectedCallback() {
        this.fetchVehicles();
    }

    fetchVehicles() {
        getVehicles()
            .then(result => {
                this.vehicles = result;
            })
            .catch(error => {
                console.error(error);
            });
    }


}