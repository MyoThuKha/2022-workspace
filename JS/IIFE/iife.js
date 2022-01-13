//Immediately Invoked Funcion Expression
//cannot access to other people(cannot access globally)
const sayHi = (function (){
    var greet = "Hi";

    function printHi(){
        console.log(greet);
    }
    //Not printHi() 
    return printHi;
})();

sayHi();
