const express = require('express')
const { generateUrl, redirectToURL } = require("../controllers")

const router = express.Router()

router.post('/url', generateUrl)

router.get('/:id', redirectToURL)

module.exports = router;

