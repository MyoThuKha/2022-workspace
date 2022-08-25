for (let i = 0; i < 100; i++) {
  let result = "";
  if (i % 3 == 0) {
    result += "fizz";
  }
  if (i % 5 == 0) {
    result += "buzz";
  } else {
    result = i;
  }

  console.log(result);
}
