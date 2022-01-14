function printOne(){console.log("One")};

function printTwo(){console.log("Two")};

function printThree(){console.log("Three")};


setTimeout(printOne, 1000);
setTimeout(printTwo, 0);
printThree();
