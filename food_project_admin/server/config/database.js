const { Sequelize } = require("sequelize");

const db = new Sequelize('food-project', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
})

module.exports = db;