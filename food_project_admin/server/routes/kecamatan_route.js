const express = require("express")
const KecamatanController = require("../controllers/kecamatan_controller")
const router = express.Router()

router.get("/", KecamatanController.allKecamatan)
router.get("/ongkir/:id", KecamatanController.ongkirById)

module.exports = router