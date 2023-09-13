const express = require('express')
const router = express.Router()
const {
    createShopItem,
    getShopItemById,
    getShopItemsByStoreName
}= require('../controllers/shopItemController')


router.get('/:id', getShopItemById)

router.post('/',createShopItem)

router.post('/getByStoreName',getShopItemsByStoreName)
    


module.exports = router