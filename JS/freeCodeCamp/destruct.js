//destructuring

const myObj = { x: 1, y: 2, z: 3 };
const myArr = [10, 20, 30];
const { x: a, y: b, z: c } = myObj;

const [d, e, f] = myArr;

console.log(a, b, c, d, e, f);

function addTwo({ x, y }) {
  return x + y;
}

console.log(addTwo(myObj));
