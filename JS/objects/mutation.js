const obj = {};

obj.a = 'a';
obj.b = 'b';

//basically obj2 is pointing at obj. (like pointers)
const obj2 = obj;

obj.a = "New value";

console.log(obj2.a);
