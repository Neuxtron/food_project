const { DataTypes } = require("sequelize")
const sequelize = require("../config/database")
const KategoriModel = require("./kategori_model")
const GambarProdukModel = require("./gambar_produk_model")

const ProdukModel = sequelize.define("produk", {
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
  deskripsi: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  harga: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  idKategori: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  stock: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  freezeTableName: true,
})

ProdukModel.belongsTo(KategoriModel, { foreignKey: "idKategori", onDelete: "CASCADE" })
ProdukModel.hasMany(GambarProdukModel, {
  as: "gambar",
  foreignKey: "idProduk",
  onDelete: "CASCADE"
})

module.exports = ProdukModel