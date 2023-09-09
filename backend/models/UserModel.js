const mongoose = require('mongoose')

const Schema = mongoose.Schema

const userSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    handle:{
        type: String,
        required: true,
        unique: true
    },
    following:{
        type: Array,
        required: true
    },
    followers:{
        type: Array,
        required: true
    },
    likes:{
        type: Number,
        required: true
    },
    profilePicUrl:{
        type: String
    }
},{timestamps:true})

userSchema.statics.createUser = async function(req){
    let { name,handle, following, followers, likes ,profilePicUrl} = req.body
    let emptyFields = []

    if(!name) emptyFields.push("name")
    if (!handle) emptyFields.push("handle")
    if (!likes) emptyFields.push("likes")
    if(emptyFields.length > 0){
        throw Error("Please fill in all fields: " + emptyFields)
    }
    if (!following){
        following = []
    }
    if (!followers){
        followers = []
    }

    if(!profilePicUrl){
        profilePicUrl = ""
    }
    const user= await this.create({ name,handle,following,followers,likes,listOfWishLists:[], profilePicUrl})
    return user
}



userSchema.statics.getUserById= async function (req){
    const {id} = req.params
    if (!mongoose.Types.ObjectId.isValid(id)){
        throw Error("Invalid ID")
    }
    const user = await this.findById(id)
    if (!user){
        throw Error("No such user")
    }
    return user
}

userSchema.statics.getUserFollowers = async function(req){
    const {id} = req.params
    if (!mongoose.Types.ObjectId.isValid(id)){
        throw Error("Invalid ID")
    }
    const user = await this.findById(id)
    if (!user){
        throw Error("No such user")
    }
    return user.followers
}

userSchema.statics.getUserFollowing = async function(req){
    const {id} = req.params
    if (!mongoose.Types.ObjectId.isValid(id)){
        throw Error("Invalid ID")
    }
    const user = await this.findById(id)
    if (!user){
        throw Error("No such user")
    }
    return user.following
}

userSchema.statics.addFollower = async function(req){
    const {id} = req.params
    if (!mongoose.Types.ObjectId.isValid(id)){
        throw Error("Invalid ID")
    }
    const user = await this.findById(id)
    if (!user){
        throw Error("No such user")
    }
    return user.followers
}

userSchema.statics.follow = async function(req){
    const {userId, userToFollowId} = req.body
    if (!mongoose.Types.ObjectId.isValid(userId)){
        throw Error("Invalid ID")
    }
    if (!mongoose.Types.ObjectId.isValid(userToFollowId)){
        throw Error("Invalid ID")
    }
    const user = await this.findById(userId)
    if (!user){
        throw Error("No such user")
    }
    const userToFollow = await this.findById(userToFollowId)
    if (!userToFollowId){
        throw Error("No such user")
    }
    user["following"].push(userToFollowId)
    userToFollow["followers"].push(userId)
    const updatedUser = await user.save()
    const updatedUserToFollow = await userToFollow.save()
    return updatedUser
}



module.exports = mongoose.model('user', userSchema)