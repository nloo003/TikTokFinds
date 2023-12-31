const mongoose = require('mongoose')

const Schema = mongoose.Schema

const wishListSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    description:{
        type: String,
        required: true
    },
    items:{
        type: Array,
        requred: true
    },
    creatorId:{
        type: String,
        required: true
    },
    creatorName:{
        type:String,
        required: true
    },
    wishListImage:{
        type:String
    }
},{timestamps:true})

wishListSchema.statics.createWishList = async function(req){
    let { name, description,creatorId, creatorName, wishListImage} = req.body
    let emptyFields = []

    if(!name) emptyFields.push("name")
    if (!description) emptyFields.push("description")
    if (!creatorId) emptyFields.push("creatorId")
    if (!creatorName) emptyFields.push("creatorName")
    if(emptyFields.length > 0){
        throw Error("Please fill in all fields: " + emptyFields)
    }
    if (!wishListImage){
        wishListImage = ""
    }
    const wishList = await this.create({ name, description,creatorId, creatorName, items:[], wishListImage})
    return wishList
}

wishListSchema.statics.addItem = async function(req){
    const {wishListId, itemId} = req.body
    if (!mongoose.Types.ObjectId.isValid(wishListId)){
        throw Error("Invalid wish list ID")
    }
    if (!mongoose.Types.ObjectId.isValid(itemId)){
        throw Error("Invalid item ID")
    }
    const wishList = await this.findById(wishListId)
    if (!wishList){
        throw Error("No such wishList")
    }
    wishList["items"].push(itemId)
    const updatedWishList = await wishList.save()
    return updatedWishList
}



wishListSchema.statics.getWishListById = async function (req){
    const {id} = req.params
    if (!mongoose.Types.ObjectId.isValid(id)){
        throw Error("Invalid wish list ID")
    }
    const wishlist = await this.findById(id)
    if (!wishlist){
        throw Error("No such wishlist")
    }
    return wishlist
}

wishListSchema.statics.getWishListsByUserId = async function(req){
    const {userId} = req.params
    if (!mongoose.Types.ObjectId.isValid(userId)){
        throw Error("Invalid user ID")
    }
    const wishlists = await this.find({creatorId: userId})

    return wishlists
}

wishListSchema.statics.getAllWishLists = async function(req){
    const allWishLists = await this.find({}).sort({createdAt:-1})
    return allWishLists
}


module.exports = mongoose.model('wishList', wishListSchema)