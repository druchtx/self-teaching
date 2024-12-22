#!/usr/bin/env node

import repl from "node:repl";

const local = repl.start('$ ')
local.on('exit', () => {
    console.log('exiting repl')
    process.exit()
})