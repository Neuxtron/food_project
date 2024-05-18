const GambarProdukModel = require("../models/gambar_produk_model")
const ProdukModel = require("../models/produk_model")

class ProdukController {
  static allProduk(req, res) {
    ProdukModel.findAll({
      include: [GambarProdukModel]
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