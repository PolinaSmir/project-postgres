class Product {
  static _client;
  static _tableName;

  static async bulkCreate(phonesArray) {
    const valueString = phonesArray
      .map(({ brand, model, price, quantity = 1, category }) => `('${brand}', '${model}', '${price}', '${quantity}', '${category}')`)
      .join(",");

    const { rows } = await this._client.query(
      `INSERT INTO ${this._tableName} (brand, model, price, quantity, category) VALUES
        ${valueString} RETURNING *;`
    );

    return rows;
  }
}

module.exports = Product;
