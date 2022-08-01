function demo() {
  let i = "Function scope";
  if (true) {
    let i = "Inner scope";
    console.log(i);
  }
  console.log(i);
}

demo();
