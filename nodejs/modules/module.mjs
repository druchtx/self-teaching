import data from './data/data.json' with {type: 'json'}

console.log(`imported json data :`, data)

import fs, { readFileSync } from 'node:fs';
import { syncBuiltinESMExports } from 'node:module';
import { Buffer } from 'node:buffer';

fs.readFileSync = () => Buffer.from('Hello, ESM');
// syncBuiltinESMExports();

console.log(fs.readFileSync === readFileSync)