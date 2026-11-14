const mongoose = require("mongoose")
const { error } = require("node:console")

async function connectMongoDB(url) {
    mongoose.connect(url)
        .then(() => console.log("Connection To MongoDB Successful"))
        .catch((err) => console.log(err))
}
module.exports = { connectMongoDB }