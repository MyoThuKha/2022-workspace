function addOne(num){
    return (num+1);
}

function eleven(){
    return (addOne(10));
}

function result(){
    return console.log(eleven() + eleven());
}

result();

