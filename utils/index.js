module.exports.mapUsers = (usersArray) => {
  return usersArray
    .map(
      (currentUser) =>
        `('${currentUser.firstName}', '${currentUser.lastName}', '${currentUser.email}', ${currentUser.isSubscribed}, '${currentUser.gender}')`
    )
    .join(",");
};
