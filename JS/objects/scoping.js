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

function let_eg(){
    //with 'let', you can change value but cannot declare second time.
    let var_let = 34;
    var_let = 56;
    console.log(var_let);

    //will give error
    let var_let = 84;
}

/*------------------------------------------*/

console.log(case2().a);

let_eg();
