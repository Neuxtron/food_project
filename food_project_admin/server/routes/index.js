const express = require("express")
const router = express.Router()

const kategoriRouter = require("./kategori_route")
const produkRouter = require("./produk_route")
const keranjangRouter = require("./keranjang_route")
const userRouter = require("./user_route")
const orderRouter = require("./order_route")
const metodeBayarRouter = require("./metode_bayar_route")
const kecamatanRouter = require("./kecamatan_route")

router.use("/kategori", kategoriRouter)
router.use("/produk", produkRouter)
router.use("/keranjang", keranjangRouter)
router.use("/user", userRouter)
router.use("/order", orderRouter)
router.use("/metode_bayar", metodeBayarRouter)
router.use("/kecamatan", kecamatanRouter)

module.exports = router