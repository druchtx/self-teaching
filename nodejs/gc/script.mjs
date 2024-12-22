import os from 'node:os'


let len = 1_000_000;
const entries = new Set()

function addEntry() {
    const entry = {
        timeStamp: Date.now(),
        memory: os.freemem(),
        totalMemory: os.totalmem(),
        uptime: os.uptime(),
    }
    entries.add(entry)
}

function summary() {
    console.log(`Total: ${entries.size} entries`)
}

(() => {
    while (len > 0) {
        addEntry()
        process.stdout.write(`~~> ${len} entries to record \r`)
        len--
    }

    summary()
})();