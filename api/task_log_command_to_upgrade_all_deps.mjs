import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';

const obj = JSON.parse(readFileSync(resolve('package.json'), { encoding: 'utf-8' }));
const dependencies = Object.keys(obj.dependencies ?? {});
const devDependencies = Object.keys(obj.devDependencies ?? {});
const command = `npm i ${dependencies.join(' ')} && npm i -D ${devDependencies.join(' ')}`;
console.log(command);
