const _ = require("lodash");

module.exports.mapUsers = (usersArray) => {
  return usersArray
    .map(({ name: { first, last }, email, gender }) => `('${first}', '${last}', '${email}', ${Boolean(Math.random() > 0.5)}, '${gender}')`)
    .join(",");
};

const PHONES_BRANDS = ["Samsung", "IPhone", "Xiaomi", "Huawei", "Sony", "Nokia"];

const generateOnePhone = (modelNumber) => ({
  brand: PHONES_BRANDS[_.random(0, PHONES_BRANDS.length - 1, false)],
  model: `model ${modelNumber}`,
  quantity: _.random(10, 1500, false),
  price: _.random(150, 10000, false),
  category: "phones",
});

// module.exports.generatePhones = (phonesCount = 100) => {
//   const phonesArray = [];

//   for (let i = 0; i < phonesCount; i++) {
//     phonesArray.push(generateOnePhone(i));
//   }

//   return phonesArray;
// };

module.exports.generatePhones = (phonesCount = 100) => new Array(phonesCount).fill(null).map((currentElement, index) => generateOnePhone(index));
