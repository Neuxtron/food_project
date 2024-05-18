const express = require("express")
const router = express.Router()

const kategoriRouter = require("./kategori_route")
const produkRouter = require("./produk_route")
const trolleyRouter = require("./keranjang_route")
const userRouter = require("./user_route")
const orderRouter = require("./order_route")

router.use("/kategori", kategoriRouter)
router.use("/produk", produkRouter)
router.use("/trolley", trolleyRouter)
router.use("/user", userRouter)
router.use("/order", orderRouter)

module.exports = router