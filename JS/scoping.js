//Global scope but has no reason to use it. just fyi.
thisIsAVar = "Hello world";


//Here i tried to change constant variable and it will give me error.
function case1(){
    const name = "John";
    name = "Sam";
}


//This one is okay cause We are still pointing to that object.Only memebers that are mutable are changed.
function case2(){
    const obj = {};
    obj.a = 'value';
    return obj;
}


//with 'let', you can change value but cannot declare second time.
function let_eg(){
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
