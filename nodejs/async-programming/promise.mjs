
import fs from "node:fs";

function readJSONSync(filename) {
    const data = fs.readFileSync(filename, 'utf-8');
    return JSON.parse(data);
}


const wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

wait(0).then(() => console.log(1));
Promise.resolve()
    .then(() => console.log(2))
    .then(() => console.log(3));
console.log(4); 


