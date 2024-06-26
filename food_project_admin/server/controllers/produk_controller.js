const { Sequelize } = require("sequelize");
const ProdukModel = require("../models/produk_model")

class ProdukController {
  static allProduk(req, res) {
    ProdukModel.findAll({
      include: ["gambar"]
    })
      .then((data) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil data produk",
          data: data,
        })
      })
      .catch((err) => {
        console.log(err)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: {},
        })
      })
  }
}

module.exports = ProdukController