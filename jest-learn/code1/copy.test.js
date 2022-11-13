const copy = require("./copy");

test("duplicate arrray", () => {
  const array = [1, 2, 3];
  expect(copy(array)).toStrictEqual(array);
});
