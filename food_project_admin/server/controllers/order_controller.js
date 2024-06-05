const GambarProdukModel = require("../models/gambar_produk_model")
const OrderModel = require("../models/order_model")
const ProdukModel = require("../models/produk_model")
const KeranjangController = require("./keranjang_controller")

class OrderController {
  static createOrder(req, res) {
    const order = req.body.order
    const listKeranjangRaw = req.body.keranjang
    const idUser = req.idUser

    if (order.idMetodeBayar === 1) {
      order.status = "Dikirim"
    }

    OrderModel.create({ ...order, idUser })
      .then(async (data) => {
        const listKeranjang = listKeranjangRaw.map((keranjang) => {
          keranjang.idOrder = data.id
          return keranjang
        })
        await KeranjangController.updateKeranjangLocal(listKeranjang, idUser)
        res.status(201).json({
          status: true,
          message: "Berhasil membuat order",
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

  static getOrders(req, res) {
    const idUser = req.idUser

    OrderModel.findAll({
      where: { idUser },
      include: [
        {
          association: "keranjang",
          include: [{
            model: ProdukModel,
            include: ["gambar"]
          }],
        },
      ],
      order: [["createdAt", "DESC"]]
    })
      .then((data) => {
        const listRiwayat = data.map((riwayat) => {
          const riwayatData = riwayat.get()
          const img = riwayat.keranjang[0].produk.images
          let total = riwayatData.ongkir
          riwayat.keranjang.forEach((keranjang) => {
            total += keranjang.amount * keranjang.produk.harga
          })
          return { img, total, ...riwayatData }
        })

        res.status(200).json({
          status: true,
          message: "Berhasil mengambil riwayat user",
          data: listRiwayat,
        })
      })
      .catch((err) => {
        console.log(err)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: [],
        })
      })
  }
}

module.exports = OrderController
