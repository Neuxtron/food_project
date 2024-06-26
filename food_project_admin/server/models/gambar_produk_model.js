const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")

const GambarProdukModel = sequelize.define("gambar_produk", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  fileName: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  idProduk: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  freezeTableName: true,
})

module.exports = GambarProdukModel