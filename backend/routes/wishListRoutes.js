const express = require('express')
const router = express.Router()
const {
    createWishList,
    addItemToWishList,
    getWishListById,
    getWishListsByUserId
} = require('../controllers/wishListController')




router.get('/wishListInfo/:id',getWishListById)

router.get('/userWishLists/:userId', getWishListsByUserId)

router.post('/add', addItemToWishList)

router.post('/', createWishList)
    
 

module.exports = router