const express = require('express')
const router = express.Router()
const {
    createWishList,
    addItemToWishList,
    getWishListById,
    getWishListsByUserId,
    getAllWishLists
} = require('../controllers/wishListController')




router.get('/wishListInfo/:id',getWishListById)

router.get('/userWishLists/:userId', getWishListsByUserId)

router.post('/add', addItemToWishList)

router.post('/', createWishList)

router.get('/all', getAllWishLists)
    
 

module.exports = router