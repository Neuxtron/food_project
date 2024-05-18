const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")

const MetodeBayarModel = sequelize.define("metode_bayar", {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true,
  },
  nama: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  gambar: {
    type: DataTypes.STRING,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

module.exports = MetodeBayarModel