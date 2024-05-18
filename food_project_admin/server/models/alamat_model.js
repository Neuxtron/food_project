const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const UserModel = require("./users_model")

const AlamatModel = sequelize.define("alamat", {
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
  alamat: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

AlamatModel.belongsTo(UserModel, { foreignKey: "idUser", onDelete: "CASCADE" })

module.exports = AlamatModel