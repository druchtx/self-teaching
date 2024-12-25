#!/usr/bin/env node

import yargs from 'yargs'


const opts =yargs(process.argv.slice(2))
.env('ACCEL')
.alias('i', 'ingredient')
.describe('i', 'choose your sandwich ingredients')
.choices('i', ['peanut-butter', 'jelly', 'banana', 'pickles'])
.help('info')
.argv

console.log(opts)