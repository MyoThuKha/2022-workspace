function addOne(num){
    throw new Error('This is Error message at addOne');
    return (num+1);
}

function eleven(){
    return (addOne(10));
}

function result(){
    return console.log(eleven() + eleven());
}

result();
