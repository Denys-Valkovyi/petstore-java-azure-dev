import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    stages: [
        { duration: '1m', target: 50 },    // Ramp-up to 50 users over 1 minute
        { duration: '1m', target: 200 },    // Spike to 200 users in 1 minute
        { duration: '15m', target: 200 },    // Stay at 200 users for 15 minutes
    ],
};

export default function () {
    http.get('https://denys-petstorepetservice-eastus.azurewebsites.net/petstorepetservice/v2/pet/info');
    sleep(1);
}
