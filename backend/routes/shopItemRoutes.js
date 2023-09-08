const express = require('express')
const router = express.Router()
const {
    createShopItem,
    getShopItemById
}= require('../controllers/shopItemController')


router.get('/:id', getShopItemById)

router.post('/',createShopItem)
    


module.exports = router