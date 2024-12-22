import ProgressBar from "progress";

const bar = new ProgressBar(':bar', { total: 100 });
const timer = setInterval(() => {
    bar.tick(5);
    if (bar.complete) {
        clearInterval(timer);
    }
}, 100);
