function case1(){
    //Here i tried to change constant variable and it will give me error.
    const name = "John";
    name = "Sam";
}

function case2(){
    //This one is okay cause We are still pointing to that object.Only memebers that are mutable are changed.
    const obj = {};
    obj.a = 'value';
    return obj;
}

console.log(case2().a);
