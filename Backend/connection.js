const mongoose = require("mongoose")
const { error } = require("node:console")

async function connectMongoDB(url) {
    mongoose.connect(process.env.DB_URL)
        .then(() => console.log("Connection To MongoDB Successful"))
        .catch((err) => console.log(err))
}
module.exports = { connectMongoDB }
