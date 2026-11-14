const { nanoid } = require("nanoid")
const Url = require("../models/url")

async function generateUrl(req, res) {
    if (!req.body.url) return res.status(400).json({ msg: "Url Not Provided" })

    const shortId = nanoid(8);
    const url = await Url.create({
        shortId: shortId,
        redirectUrl: req.body.url,
    })

    return res.status(201).json({
        msg: "URL Created",
        url: url.shortId
    })

}

async function redirectToURL(req, res) {
    const shortId = req.params.id;
    const url = await Url.findOne({ shortId })
    if (!url) return res.status(404).json({ msg: "URL Not Found" })
    return res.redirect(url.redirectUrl)
}

module.exports = {
    generateUrl,
    redirectToURL,
}