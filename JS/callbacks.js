function doSomethingAsync(callback){
    setTimeout(function(){callback(3)},1000);
}

doSomethingAsync(console.log);
