hoisting();
varHoist();


var x = 3;
var y = 67;
var z = 'Hello nice to meet you.';

//You can call function above function. it is called (hoisting).

function hoisting(){
    console.log("Hoisted");
}

//cannot use in some case. (const cannot use before it declare. Error)

const cantHoist = function(){console.log("Can't Hoist");};

//undefined. (Error)
var varHoist = function(){console.log("Hoisting with var type")};
