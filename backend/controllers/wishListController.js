const mongoose = require('mongoose')
const WishList = require('../models/WishListModel')
const ShopItem = require("../models/ShopItemModel")


const getWishListById = async (req,res) => {
    try{
        const wishList = await WishList.getWishListById(req)
        res.status(200).json(wishList)
    }catch(error){
        res.status(404).json("error", error.message)
    }
    
}

const getWishListsByUserId = async (req,res)=>{
    try{
        const wishLists = await WishList.getWishListsByUserId(req)
        res.status(200).json(wishLists)
    }catch(error){
        res.status(404).json("error", error.message)
    }
}

const createWishList = async(req,res) => {
    try{
        const wishList = await WishList.createWishList(req)
        res.status(200).json(wishList)
    } catch(error){
        res.status(404).json("error", error.message)
    }
}
const addItemToWishList = async(req,res) => {
    try{
        const addedShopItem = await WishList.addItem(req)
        res.status(200).json(addedShopItem)

    } catch(error){
        res.status(404).json(error)
    }
}


module.exports = {
    createWishList,
    addItemToWishList,
    getWishListById,
    getWishListsByUserId
}