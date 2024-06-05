const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const ProdukModel = require("./produk_model")
const UserModel = require("./users_model")

const KeranjangModel = sequelize.define("keranjang", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  idUser: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  idProduk: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  amount: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  idOrder: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  freezeTableName: true,
})

KeranjangModel.belongsTo(ProdukModel, { foreignKey: "idProduk", onDelete: "CASCADE" })
KeranjangModel.belongsTo(UserModel, { foreignKey: "idUser", onDelete: "CASCADE" })

module.exports = KeranjangModel