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
    let num_let = 34;
    num_let = 56;
    console.log(num_let);

    //will give error
    //let num_let = 84;
}

function var_eg(){
    var num_var = 56;
    console.log(num_var);
    var num_var = 34;
    console.log(num_var);
}
/*------------------------------------------*/

console.log(case2().a);

//let_eg();

var_eg();
