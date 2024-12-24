import TicketManager from "./event.mjs";

const ticketManager = new TicketManager(10);

ticketManager.on("buy", () => {
    console.log("Someone bought a ticket!");
});
ticketManager.buy("test@email.com", 20);