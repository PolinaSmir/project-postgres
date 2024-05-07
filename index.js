const { User, Product, Order, client } = require("./models");
const { getUsers } = require("./api");
const { generatePhones } = require("./utils");

async function runRequest() {
  await client.connect();

  const usersArray = await getUsers();
  const response1 = await User.bulkCreate(usersArray);

  const phonesArray = generatePhones(400);
  const response2 = await Product.bulkCreate(phonesArray);

  const { rows: usersArrayForOrders } = await User.findAll();
  const { rows: productsArray } = await Product.findAll();
  const response = await Order.bulkCreate(usersArrayForOrders, productsArray);

  console.log(response);

  await client.end();
}

runRequest();
