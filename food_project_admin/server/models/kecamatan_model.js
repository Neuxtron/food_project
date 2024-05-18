const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")

const KecamatanModel = sequelize.define("kecamatan", {
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
  ongkir: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  freezeTableName: true,
})

module.exports = KecamatanModel