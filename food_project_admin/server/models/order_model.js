const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const UserModel = require("./users_model")
const MetodeBayarModel = require("./metode_bayar_model")

const OrderModel = sequelize.define("orders", {
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
  status: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: "Pending",
  },
  idMetodeBayar: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  ongkir: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

OrderModel.belongsTo(UserModel, { foreignKey: "idUser", onDelete: "CASCADE" })
OrderModel.belongsTo(MetodeBayarModel, { foreignKey: "idMetodeBayar", onDelete: "CASCADE" })

module.exports = OrderModel