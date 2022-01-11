const obj = {
    a: 'a',
    b: 'b',
    c: {
        key: 'value'
    }
}

const obj2 = Object.assign({},obj);

//Although obj2 is the clone of obj, the objects c in both are indicating one value.
obj2.c.key = 'New value';

console.log(obj.c.key);
