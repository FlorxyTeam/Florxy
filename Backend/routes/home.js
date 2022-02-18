const express = require("express");
const { json } = require("express/lib/response");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require('../middleware');
const User = require("../models/users.model");
const Profile = require("../models/profile.model");
const Post = require("../models/post.model");


const router = express.Router();

router.route("/getPost").get( (req, res) => {
    Post.find({}, (err, result) => {
    // console.log('result: '+ result);
      if (err) return res.json({ err: err });
      if (result == null) return res.json({ data: [] });
      else return res.json({ data: result });
    });
  });

// router.post("/addPost", async(req,res) => {
//     const { post, comment, favorite } = req.body;

//     const postItem = Post.set({ post, comment, favorite });

//     await postItem.save();

//     return res.status(200).json({
//         data: postItem
//     });
// });

// router.route("/addFav/:id").get(middleware.checkToken,(req,res)=>{
//     Profile.findByIdAndUpdate()
// })

module.exports = router;