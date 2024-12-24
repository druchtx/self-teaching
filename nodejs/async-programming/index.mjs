import TicketManager from './event.mjs'
import EmailService from './email-service.mjs'
import DatabaseService from './database.mjs'


const ticketManager = new TicketManager(3);
const emailService = new EmailService();
const databaseService = new DatabaseService();


ticketManager.on("buy", (email, price, timestamp) => {
    emailService.send(email);
    databaseService.save(email, price, timestamp);
});

const onError = (err) => {
    console.error(err);
}
ticketManager.on("error", onError);

ticketManager.buy("test@email.com", 10);
ticketManager.buy("test@email.com", 10);
ticketManager.buy("test@email.com", 10);
ticketManager.buy("test@email.com", 10);
ticketManager.buy("test@email.com", 10);

console.log(ticketManager.listenerCount('error'));
ticketManager.off('error', onError);
console.log(ticketManager.listenerCount('error'));