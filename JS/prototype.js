//Methods
const arr = [];

arr.push('value 1');
arr.push('value 2');

arr.__proto__;

arr.__proto__.__proto__;

//Test this code in browser console to understand.


//Primative types don't have method(Error). But
const num = 42;
console.log(num.toString());
console.log(typeof num.toString());

//FYI, You can change the prototype by assigning something. But Don't.
