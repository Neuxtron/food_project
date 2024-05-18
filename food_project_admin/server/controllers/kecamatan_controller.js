const { Sequelize } = require("sequelize");
const KecamatanModel = require("../models/kecamatan_model");

class KecamatanController {
  static allKecamatan(req, res) {
    KecamatanModel.findAll()
      .then((data) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil data kecamatan",
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
  static ongkirById(req, res) {
    const { id } = req.params
    
    KecamatanModel.findOne({ where: { id } })
      .then((data) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil data kecamatan",
          data: data.ongkir,
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

module.exports = KecamatanController