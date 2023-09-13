const mongoose = require('mongoose')
const ShopItem = require('../models/ShopItemModel')


const getShopItemById = async (req,res) => {
    try{
        const shopItem = await ShopItem.getShopItemById(req)
        res.status(200).json(shopItem)
    }catch(error){
        res.status(404).json({error: error.message})
    }
    
}


const createShopItem = async (req,res) => {
    try{
    const shopItem = await ShopItem.createShopItem(req)
    res.status(200).json(shopItem)
    }
    catch(error){
        res.status(404).json({error: error.message})
    }
    
}



module.exports = {
    createShopItem,
    getShopItemById
}