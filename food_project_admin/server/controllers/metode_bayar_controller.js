const { Sequelize } = require("sequelize");
const MetodeBayarModel = require("../models/metode_bayar_model");

class MetodeBayarController {
  static allMetodeBayar(req, res) {
    MetodeBayarModel.findAll()
      .then((data) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil data metode pembayaran",
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

module.exports = MetodeBayarController