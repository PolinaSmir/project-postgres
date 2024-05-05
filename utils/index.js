module.exports.mapUsers = (usersArray) => {
  return usersArray
    .map(({ name: { first, last }, email, gender }) => `('${first}', '${last}', '${email}', ${Boolean(Math.random() > 0.5)}, '${gender}')`)
    .join(",");
};
