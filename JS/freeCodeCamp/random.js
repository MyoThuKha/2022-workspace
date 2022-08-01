"use strict";
function randomValue() {
  //Math.random 0 <= x <1
  return Math.random();
}

function randomWholeNumber() {
  var val = randomValue();
  //Math.random range 30
  return Math.floor(val * 30);
}

function strToInt(str) {
  //change base 2 number to int
  return parseInt(str, 2);
}

console.log(randomWholeNumber());
console.log(strToInt("10"));
