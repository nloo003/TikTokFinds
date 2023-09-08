require('dotenv').config()

const express = require('express')
const mongoose = require('mongoose')
const userRoutes = require('./routes/userRoutes')
const shopItemRoutes = require("./routes/shopItemRoutes")
const wishListRoutes = require("./routes/wishListRoutes")
const app = express()

//middleware
app.use(express.json())

app.use((req,res,next)=>{
    console.log(req.path, req.method)
    next()
})


app.get('/',(req,res)=>{
    res.send("hello world!")
})

app.use('/api/user',userRoutes)
app.use('/api/shopItem',shopItemRoutes)
app.use('/api/wishList',wishListRoutes)
mongoose.connect(process.env.MONGO_URI).then(()=>{
    app.listen(process.env.PORT,()=>{ 
        console.log("connected!")
        console.log("listening on port ", process.env.PORT)
    })
}).catch((error)=>{ s
    console.log(error)
})





