//Cannot access the function and the variable inside by others.
const count = (function (){
    let num = 0;
    return {
        add: function (){num += 1},
        print: function(){console.log(num)}
    }
})()

count.print();
count.add();
count.print();
