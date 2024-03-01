import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    stages: [
        { duration: '1m', target: 4 },    // Ramp-up to 4 users over 1 minute
		{ duration: '3m', target: 4 },    // Keep 4 users over 3 minutes
		{ duration: '1m', target: 8 },    // Ramp-up to 8 users over 1 minute
		{ duration: '3m', target: 8 },    // Keep 8 users over 1 minute
    ],
};

export default function () {
    http.batch([
        ['GET', 'https://denys-petservice-eastus.blackground-e6b08779.eastus.azurecontainerapps.io/petstorepetservice/v2/pet/info'],
        ['GET', 'https://denys-petservice-eastus.blackground-e6b08779.eastus.azurecontainerapps.io/petstorepetservice/v2/pet/info'],
    ])
    sleep(1);
}
