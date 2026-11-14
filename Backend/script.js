const express = require("express")
const urlRouter = require("./routes/index")
const cors = require("cors");
const { connectMongoDB } = require("./connection")

const app = express();
const PORT = 3000;
app.use(cors());
app.use(express.json())
app.use(express.urlencoded({ extended: false }))

connectMongoDB("mongodb://127.0.0.1:27017/shortHand_URL")

app.use("/", urlRouter)

app.listen(PORT, () => console.log(`Server started at port: ${PORT} `))