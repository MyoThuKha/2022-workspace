const obj = {};

obj.a = 'a';
obj.b = 'b';

const obj2 = Object.assign({},obj);

obj.a = 'New value';

console.log(obj2.a);
