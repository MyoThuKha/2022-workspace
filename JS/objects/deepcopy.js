const obj = {
    a: 'a',
    b: 'b',
    c: {
        key: 'value'
    }
}

function deepCopy(argObj){
    
    //return array with keys
    const keys = Object.keys(argObj);
    const new_object = {};

    for (let i=0; i < keys.length; i++){
        const key = keys[i];

        if (typeof argObj[key] === 'object'){
            new_object[key] = deepCopy(argObj[key]);
        }
        else{
            new_object[key] = argObj[key]
        }
    }
    return new_object;
}

const obj2 = deepCopy(obj)
obj2.c.key = 'New value';

console.log(obj.c.key);
