const UserModel = require("../models/users_model")
const { secret, toko } = require("../utils/constants")
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")

class UserController {
  static getProfile(req, res) {
    const id = req.idUser

    UserModel.findOne({
      where: { id }
    })
      .then((user) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil profil user",
          data: { user, toko },
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

  static async registerUser(req, res) {
    try {

      const data = req.body
      const { email } = data

      const existingUser = await UserModel.findOne({
        where: { email }
      })
      if (existingUser) {
        res.status(409).json({
          status: false,
          message: "Email susah terdaftar",
          data: {},
        })
        return
      }
  
      const user = await UserModel.create(data)
      const { id } = user
      const token = jwt.sign({ id }, secret)
      
      await UserModel.update({ token }, {
        where: { id }
      })
      
      res.status(200).json({
        status: true,
        message: "Berhasil menambahkan user",
        data: { user, token, toko },
      })

    } catch (error) {
      console.log(error)
      res.status(500).json({
        status: false,
        message: "Terjadi kesalahan, silahkan coba lagi",
        data: {},
      })
    }
  }

  static async loginUser(req, res) {
    try {

      const { email: nama, password } = req.body
  
      const user = await UserModel.findOne({
        where: { nama }
      })
      if (user === null) {
        res.status(401).json({
          status: false,
          message: "Email atau password salah",
          data: {},
        })
        return
      }
  
      const validation = bcrypt.compareSync(password, user.password)
      if (!validation) {
        res.status(401).json({
          status: false,
          message: "Email atau password salah",
          data: {},
        })
        return
      }
  
      const id = user.id
      const token = jwt.sign({ id }, secret)

      UserModel.update({ token }, {
        where: { id }
      }).then((_) => {
        res.status(200).json({
          status: true,
          message: "Berhasil login",
          data: { user, token, toko },
        })
      })
      
    } catch (error) {
      console.log(error)
      res.status(500).json({
        status: false,
        message: "Terjadi kesalahan, silahkan coba lagi",
        data: {},
      })
    }
  }

  static logoutUser(req, res) {
    const id = req.idUser

    UserModel.update({ token: null }, {
      where: { id }
    })
      .then((_) => {
        res.status(200).json({
          status: true,
          message: "Berhasil logout",
          data: {},
        })
      })
      .catch((error) => {
        console.log(error)
        res.status(500).json({
          status: false,
          message: "Terjadi kesalahan, silahkan coba lagi",
          data: {},
        })
      })
  }
}

module.exports = UserController