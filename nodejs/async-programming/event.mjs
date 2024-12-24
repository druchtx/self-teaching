import { EventEmitter } from 'node:events';

// const emitter = new EventEmitter();

// emitter.on('start', () => {
//     console.log('started');
// })


// emitter.once('once', () => {
//     console.log('once');
// })

// for (let i = 0; i < 3; i++) {
//     emitter.emit('once');
//     emitter.emit('start');
// }


export default class TicketManager extends EventEmitter {
    constructor(supply) {
        super();
        this.supply = supply;
    }

    buy(email, price) {
        if (this.supply > 0) {

            this.supply--;
            this.emit('buy', email, price, Date.now());
            return;
        }
        this.emit('error', new Error('Tickets are sold out'));

    }
}


