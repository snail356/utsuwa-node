const Person = require('./person')

const p1 = new Person();
const p2 = new Person('David', 30);

console.log(p1.toJSON());
console.log(p2.toJSON());

console.log(p2.constructor.name);
console.log(typeof p2);
console.log(p2 instanceof Person);
// console.log(p2.aaa());
console.log(p2.toString());
console.log( JSON.stringify(p2) );