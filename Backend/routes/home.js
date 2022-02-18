const express = require("express");
const { json } = require("express/lib/response");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require('../middleware');
const User = require("../models/users.model");
const Profile = require("../models/profile.model");
const Post = require("../models/post.model");
const multer = require("multer");
const router = express.Router();


const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads");
  },
  filename: (req, file, cb) => {
    cb(null, req.params.id + ".jpg");
  },
});

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 6,
  },
});

router.route("/getPost").get( (req, res) => {
    Post.find({}, (err, result) => {
    // console.log('result: '+ result);
      if (err) return res.json({ err: err });
      if (result == null) return res.json({ data: [] });
      else return res.json({ data: result });
    });
 });
router.route("/add/postImage/:id").patch(middleware.checkToken,upload.single("img"),(req,res)=>{
    Post.findOneAndUpdate({_id:req.params.id},
    {
        $set: {
          coverImage: req.file.path,
        },
      },
      { new: true },
      (err,result)=>{
        if(err)return res.json(err);
        return res.json(result);
      }
    )
});

router.route("/Add").post(middleware.checkToken,(req, res)=>{
    const createpost = Post({
        email: req.decoded.email,
        username:req.body.username,
        fullname:req.body.fullname,
        type: req.body.type,
        rating: req.body.rating,
        body: req.body.body,
        forwho: req.body.forwho
    });
    createpost
    .save()
    .then((result)=>{
        res.json({data:result}).catch((err)=>{
        console.log(err),
        res.json({err:err});
        });
    });
});

router.route("/getOwnPost").get(middleware.checkToken,(req,res)=>{
    Post.find({email:req.decoded.email},(err,result)=>{
        if(err)return res.json(err);
        return res.json({data:result})
    });
});

router.route("/getAllPost").get(middleware.checkToken,(req,res)=>{
    Post.find({},(err,result)=>{
        if(err)return res.json(err);
        return res.json({data:result})
    });
});

router.route("/delete/:id").delete(middleware.checkToken,(req,res)=>{
    Post.findOneAndDelete({
        $and:[
        {email:req.decoded.email},
        {_id:req.params.id}
        ],
    },
    (err,result)=>{
        if(err) return res.json(err);
        else if(result) {
            console.log(result);
            return res.json("Blog Deleted");
        }
        return res.json("Blog not deleted");
      }
    );
})

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