//Map implementation

function map(arr,func){
    const newArr = [];
    for(let i=0;i<arr.length;i++){
        newArr.push(func(arr[i]));
    }
    return newArr;
}

arr = [0,1,2,3];

const addOne = function (num){return (num+1)};

console.log(map(arr,addOne));
