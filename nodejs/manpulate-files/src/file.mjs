import fs from "node:fs";

fs.stat('/Users/hsulzz/.zshrc', (err, stats) => {
    if (err) {
        console.error(err)
        return
    }
    console.log(stats.isFile(),
        stats.isDirectory(),
        stats.isSymbolicLink(),
        stats.size,
        stats
    )
}
)