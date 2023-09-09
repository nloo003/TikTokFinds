const mongoose = require('mongoose')
const User = require('../models/UserModel')


const getUserById = async (req,res) => {
    try{
        const user= await User.getUserById(req)
        res.status(200).json(user)
    }catch(error){
        res.status(404).json({error: error.message})
    }
    
}


const getUserFollowers = async (req,res) => {
    try{
    const followers = await User.getUserFollowers(req)
    res.status(200).json(followers)
    }
    catch(error){
        res.status(404).json({error: error.message})
    }
    
}

const getUserFollowing = async (req,res) => {
    try{
        const following = await User.getUserFollowing(req)
        res.status(200).json(following)
    }catch(error){
        res.status(404).json({error: error.message})
    }
    
}


const createUser = async (req,res) => {
    try {
        const user = await User.createUser(req)
        res.status(200).json(user)
    } catch(error){
        res.status(400).json({error: error.message})
    }
}

const followUser = async(req,res) =>{
    try {
        const user = await User.follow(req)
        res.status(200).json(user)
    } catch(error){
        res.status(400).json({error: error.message})
    }
}


module.exports = {
    createUser,
    getUserById,
    getUserFollowers,
    getUserFollowing,
    followUser
}