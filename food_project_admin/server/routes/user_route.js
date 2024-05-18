const express = require("express")
const UserController = require("../controllers/user_controller")
const authentication = require("../middlewares/authentication")
const router = express.Router()

router.get("/", authentication, UserController.getProfile)
router.post("/register", UserController.registerUser)
router.post("/login", UserController.loginUser)
router.get("/logout", authentication, UserController.logoutUser)

module.exports = router