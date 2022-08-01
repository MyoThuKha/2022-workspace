var num = [1, 2, 3, 4, 5, 6];
function cue(arr, num) {
  arr.push(num);
  return arr.shift();
}

function isItTrue() {
  return 2 === "2" ? true : false;
}

function switchCase(val) {
  switch (val) {
    case 1:
    case 2:
    case 3:
      return "low";
    case 5:
    case 6:
    case 7:
      return "high";
    default:
      return "number";
  }
}

function lessThan(a, b) {
  return a < b;
}

console.log(JSON.stringify(cue(num, 0)));
console.log(isItTrue());
console.log(switchCase(3));
console.log(lessThan(3, 4));

var arr = [];

function addOdd(arr) {
  for (var i = 1; i < 10; i += 2) {
    arr.push(i);
  }
  return arr;
}

console.log(addOdd(arr));

function iterateArray(arr) {
  for (var i = 0; i < arr.length; i++) {
    console.log(arr[i]);
  }
}
