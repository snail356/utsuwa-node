// const your_name = require('./func')
// const f1 = require('./func')
//
//
// console.log( f1.f2(10))
// console.log( your_name.f1(12))
// console.log( your_name===f1 )


const {f1: func1, f2} = require('./func')

console.log( func1(10))
console.log( f2(12))
