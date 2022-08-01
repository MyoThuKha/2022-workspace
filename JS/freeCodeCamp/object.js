var obj = {
  name: "John",
  male: true,
  height: 6.4,
};

console.log(obj.name);
console.log(obj["male"]);

//adding to objects
obj["age"] = 19;
console.log(obj.age);

//deleting from object
delete obj.male;
console.log(obj.male);

//lookup
function lookupObj(val) {
  var collect = {
    xwe: 001,
    nodf: 392,
    dflf: 349,
    dfldh: 443,
    fdh: 033,
  };
  //lookup object
  console.log("look up: " + collect[val]);
}

lookupObj("nodf");
