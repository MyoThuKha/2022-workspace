//High class function(higher-order function)

const arr = [0,1,2,3,4];
console.log(arr)
//map
function addOne(y){
    return (y+1);
}

console.log(arr.map(addOne));


/*filer()
retain value that're true and get rid of value that're false.*/

function greaterThanTwo(y){
    //return true false
    return (y >1);
}

console.log(arr.filter(greaterThanTwo));


//reduce
//reduce members by some rule(function).
function add(x,y){
    return (x+y);
}

console.log(arr.reduce(add));
