const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")

const AdminModel = sequelize.define("admin", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

module.exports = AdminModel