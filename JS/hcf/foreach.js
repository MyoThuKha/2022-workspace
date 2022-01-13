//forEach is for looping each element in array.
function map(arr,func){
    const newArr =[];

    arr.forEach(function(val){
        newArr.push(func(val));
    })
    return newArr;
}

arr = [0,1,2,3];
const addOne = function(x){return (x+1);};
console.log(map(arr,addOne));
