function closure(){
    const arr = [];
    for (var i = 0; i < 3; i++){
        arr.push((function(x){
            return function(){console.log(x);}
        })(i))
    }
    return arr;
}

const clos = closure();
clos[0]();
