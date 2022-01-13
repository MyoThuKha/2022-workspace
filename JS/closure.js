function closure_bug(){
    const arr = [];
    for (var i = 0; i < 3; i++){
        arr.push(function(){console.log(i)});
    }
    return arr;
}

const cbug = closure_bug();
cbug[0]();
