import { readFileSync } from 'fs';
import { resolve } from 'path';

const filePath = resolve('package.json');
const json = readFileSync(filePath, { encoding: 'utf-8' });
const obj = JSON.parse(json);
const dependencies = Object.keys(obj['dependencies'] ?? {});
const devDependencies = Object.keys(obj['devDependencies'] ?? {});
const packages = [...dependencies, ...devDependencies];
const command = `npm install ${packages.join(' ')}`;
console.log(command);
