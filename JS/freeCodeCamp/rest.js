"use strict";
function change(...arr) {
  return arr;
}

//spread
const arr1 = [1, 2, 3, 4];
let arr2;
function spreadFunc() {
  //   arr2 = arr1;
  arr2 = [...arr1];
  arr1[0] = "mango";
  console.log(arr1);
  console.log(arr2);
}

console.log(change(1, 2, 3));
spreadFunc();
