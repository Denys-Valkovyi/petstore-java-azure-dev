import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
    http.get('https://your-app.azurewebsites.net/api/endpoint');
    sleep(1); // Adjust the sleep time as needed
}
