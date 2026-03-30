import { LightningElement, track } from 'lwc';
import getMyReservations from '@salesforce/apex/CR_ReservationController.getMyReservations';

export default class CrMyRentals extends LightningElement {
    @track reservations = [];

    columns = [
        {
            label: 'Name',
            fieldName: 'Name',
            type: 'text'
        },
        {
            label: 'Start Date',
            fieldName: 'StartDate__c',
            type: 'date'
        },
        {
            label: 'End Date',
            fieldName: 'EndDate__c',
            type: 'date'
        },
        {
            label: 'User',
            fieldName: 'User__c',
            type: 'text'
        },
        {
            label: 'Vehicle',
            fieldName: 'Vehicle__c',
            type: 'text'
        },
        {
            type: 'action',
            typeAttributes: {
                rowActions: [
                    { label: 'View', name: 'view' },
                    { label: 'Cancel', name: 'cancel' }
                ]
            }
        }
    ];

    connectedCallback() {
        this.fetchMyReservations();
    }

    fetchMyReservations() {
        getMyReservations()
            .then(result => {
                this.reservations = result;
            })
            .catch(error => {
                console.error(error);
            });
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        switch (actionName) {
            case 'view':
                this.handleView(row);
                break;
            case 'cancel':
                this.handleCancel(row);
                break;
            default:
        }
    }

    handleView(row) {
        console.log('View:', row);
    }

    handleCancel(row) {
        console.log('Cancel:', row);
    }
}