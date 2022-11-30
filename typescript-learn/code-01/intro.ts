interface hello {
  greet: string;
  name: string;
}

const greet = (greet: hello): string => {
  return greet.greet + greet.name;
};

console.log(greet({ greet: "hello ", name: "mg mg" }));
