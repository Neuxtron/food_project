const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const bcrypt = require("bcrypt")
const { saltRounds } = require("../utils/constants")
const KecamatanModel = require("./kecamatan_model")

const UserModel = sequelize.define("users", {
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
  hp: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  alamat: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  token: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  idKecamatan: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  freezeTableName: true,
  hooks: {
    beforeCreate(user, options) {
      user.password = bcrypt.hashSync(user.password, saltRounds)
    }
  }
})

UserModel.belongsTo(KecamatanModel, { foreignKey: "idKecamatan", onDelete: "CASCADE" })

module.exports = UserModel