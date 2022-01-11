const obj1 = new Object()

obj1.first = "Hello";
obj1.second = "World";

obj1.greet = function(){console.log("Hi")};


//another way to create object.
const obj2 = {};
obj2['first'] = "John";
obj2['second'] = "Sam";
obj2['names'] = function(){console.log("Hello There")};


//another another way to create object.
/* (But seriously, careful between , and ;) */

const obj3 = {
first : "Clarie",
second : "Samantha",
names : function(){console.log("Hello!")},

    address: {
    street : "Main St.",
    number : 1234
 }
}

/* Man! Js really don't give a sh*t about you. */
