//Map implementation

function map(arr,func){
    const newArr = [];
    for(let i=0;i<arr.length;i++){
        newArr.push(func(arr[i]));
    }
    return newArr;
}


//filter implementation
function filter(arr,func){
    const newArr = [];
    for (let i=0;i<arr.length;i++){
        if (func(arr[i])){
            newArr.push(arr[i]);
        }
    }
    return newArr;
}


//reduce implementation
function reduce(arr,func){
    const newArr = [];
    let number = 0;
    for (let i=0; i<arr.length; i++){
        number += arr[i];
    }
    newArr.push(number);
    return newArr;
}


const addOne = function(num){return (num+1)};
const grtTwo = function(num){return (num>2)};
const add = function(x,y){return (x+y)};
arr = [0,1,2,3,4];

console.log(arr);
console.log(map(arr,addOne));
console.log(filter(arr,grtTwo));
console.log(reduce(arr,add));
