const express = require("express");
const router = express.Router();
const BlogPost = require("../models/blogpost.model");
const middleware = require("../middleware");
const multer = require("multer");


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
  // fileFilter: fileFilter,
});

router.route("/add/postImage/:id").patch(middleware.checkToken,upload.single("img"),(req,res)=>{
    BlogPost.findOneAndUpdate({_id:req.params.id},
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
    const blogpost = BlogPost({
        email: req.decoded.email,
        title: req.body.title,
        body: req.body.body,
    });
    blogpost
    .save()
    .then((result)=>{
        res.json({data:result}).catch((err)=>{
        console.log(err),
        res.json({err:err});
        });
    });
});

router.route("/getOwnPost").get(middleware.checkToken,(req,res)=>{
    BlogPost.find({email:req.decoded.email},(err,result)=>{
        if(err)return res.json(err);
        return res.json({data:result})
    });
});

module.exports = router;