const KecamatanModel = require("../models/kecamatan_model")
const UserModel = require("../models/users_model")
const { secret } = require("../utils/constants")
const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")

class UserController {
  static getProfile(req, res) {
    const id = req.idUser

    UserModel.findOne({
      where: { id },
      include: [KecamatanModel]
    })
      .then((user) => {
        res.status(200).json({
          status: true,
          message: "Berhasil mengambil profil user",
          data: user,
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
      const { nama } = data

      const existingUser = await UserModel.findOne({
        where: { nama }
      })
      if (existingUser) {
        res.status(409).json({
          status: false,
          message: "Nama susah terdaftar",
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
        data: { user, token },
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

      const { nama, password } = req.body
  
      const user = await UserModel.findOne({
        where: { nama },
        include: [KecamatanModel]
      })
      if (user === null) {
        res.status(401).json({
          status: false,
          message: "Nama atau password salah",
          data: {},
        })
        return
      }
  
      const validation = bcrypt.compareSync(password, user.password)
      if (!validation) {
        res.status(401).json({
          status: false,
          message: "Nama atau password salah",
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
          data: { user, token },
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