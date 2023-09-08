const express = require('express')
const router = express.Router()
const {
    createUser,
    getUserById,
    getUserFollowers,
    getUserFollowing ,
    followUser
} = require('../controllers/userController')


router.get('/followers/:id', getUserFollowers)


router.get('/following/:id',getUserFollowing)

router.get('/profile/:id', getUserById)


router.post('/', createUser)
    
router.post('/follow', followUser)

module.exports = router