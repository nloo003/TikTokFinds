const mongoose = require('mongoose')

const Schema = mongoose.Schema

const shopItemSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    description:{
        type: String,
        required: true
    },
    price:{
        type: Number,
        requred: true
    },
    imageUrl:{
        type: String,
        required: true
    },
    store:{
        type:String,
        required: true
    }
},{timestamps:true})

shopItemSchema.statics.createShopItem = async function(req){
    const { name, description,price, imageUrl, store} = req.body
    let emptyFields = []

    if(!name) emptyFields.push("name")
    if (!description) emptyFields.push("description")
    if (!price) emptyFields.push("price")
    if (!imageUrl) emptyFields.push("imageUrl")
    if(!store) emptyFields.push("store")
    if(emptyFields.length > 0){
        throw Error("Please fill in all fields: " + emptyFields)
    }
    const wishList = await this.create({ name, description,price, imageUrl, store})
    return wishList
}



shopItemSchema.statics.getShopItemById = async function (req){
    const {id} = req.params
    if (!mongoose.Types.ObjectId.isValid(id)){
        throw Error("Invalid shop item ID")
    }
    const shopItem = await this.findById(id)
    if (!shopItem){
        throw Error("Shop Item")
    }
    return shopItem
}




module.exports = mongoose.model('shopItem', shopItemSchema)