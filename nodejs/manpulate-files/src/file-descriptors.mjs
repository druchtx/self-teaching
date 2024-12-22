import fs from "node:fs";

fs.open('/Users/hsulzz/.zshrc', 'r', (err, fd) => {
    if (err) {
        console.error(err)
        return
    }
    console.log(fd)
})