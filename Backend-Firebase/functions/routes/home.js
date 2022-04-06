const express = require("express");
const middleware = require("../middleware");

const Profile = require("../models/profile.model");
const Post = require("../models/post.model");
const Product = require("../models/product.model");
const Comment = require("../models/comment.model");
const multer = require("multer");
// eslint-disable-next-line new-cap
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
  Post.find({}).sort({createdAt: -1}, function(err, result) {
    // console.log('result: '+ result);
    if (err) return res.json({err: err});
    if (result == null) return res.json({data: []});
    else return res.json({data: result});
  });
});

router.route("/getIDPost/:id").get(middleware.checkToken, (req,res)=>{
  Post.findOne({ _id: req.params.id }).populate("product").exec(function(err, result){
    if(err) {
      return console.log(err);
    } else {
      res.json({ getPost: result });
    }
  });
});

router.route("/add/postImage/:id")
    .patch(middleware.checkToken, upload.single("img"), (req, res)=>{
      Post.findOneAndUpdate({_id: req.params.id},
          {
            $set: {
              coverImage: req.file.path,
            },
          },
          {new: true},
          (err, result)=>{
            if (err) return res.json(err);
            return res.json(result);
          }
      );
    });

router.route("/Add").post(middleware.checkToken, (req, res)=>{
  // eslint-disable-next-line new-cap
  const createpost = Post({
    username: req.decoded.username,
    fullname: req.body.fullname,
    type: req.body.type,
    rating: req.body.rating,
    body: req.body.body,
    forwho: req.body.forwho,
  });
  createpost
      .save()
      .then((result)=>{
        res.json({data: result}).catch((err)=>{
          console.log(err),
          res.json({err: err});
        });
      });
});

router.route("/getOwnPost").get(middleware.checkToken, (req, res)=>{
  Post.find({username: req.decoded.username}, (err, result)=>{
    if (err) return res.json(err);
    return res.json({data: result});
  });
});

router.route("/getAllPost").get(middleware.checkToken, (req, res)=>{
  Post.find({}, (err, result)=>{
    if (err) return res.json(err);
    return res.json({data: result});
  });
});

router.route("/delete/:id").delete(middleware.checkToken, (req, res)=>{
  Post.findOneAndDelete({
    $and: [
      {username: req.decoded.username,},
      {_id: req.params.id},
    ],
  },
  (err, result)=>{
    if (err) return res.json(err);
    else if (result) {
      console.log(result);
      return res.json("Blog Deleted");
    }
    return res.json("Blog not deleted");
  }
  );
});

// router.post("/addPost", async(req,res) => {
//     const { post, comment, favorite } = req.body;

//     const postItem = Post.set({ post, comment, favorite });

//     await postItem.save();

//     return res.status(200).json({
//         data: postItem
//     });
// });

router.route("/addFav/:id/:postID").post(middleware.checkToken, (req, res)=>{
  // res.json(req.params.id);
  Profile.findOneAndUpdate({_id: req.params.id},
      {$push: {favorite: req.body.favorite}}, function(err, FavPost) {
        console.log(req.params.id);
        if (err) {
          return res.json(err);
        } else {
          Post.findOneAndUpdate({_id: req.params.postID},
            {$push: {favorite: { username: req.body.username }}}, function(err, addUsername){
              if(err) {
                return res.json(err);
              } else {
                return res.json("Favorited succes!!");
              }
            });
        }
      });
});

router.route("/unFav/:id/:postID").post(middleware.checkToken, (req, res)=>{
  // res.json(req.params.id);
  Profile.findOneAndUpdate({_id: req.params.id},
      {$pull: {favorite: req.body.favorite}}, function(err, unFavPost) {
      // console.log(req.params.id);
        if (err) {
          return res.json(err);
        } else {
          Post.findOneAndUpdate({_id: req.params.postID},
            {$pull: {favorite: { username: req.body.username }}}, function(err, post) {
                return res.json("unFavorited succes!!");
              });
        }
      });
});

router.route("/createPost/mention/topMention")
    .get(middleware.checkToken, (req, res)=>{
      console.log("maaaaaaaa");
      Product.find({}).sort({mention: -1}).limit(4).exec(
          function(err, topMention) {
            if (err) {
              return res.json({err: err});
            } else if (topMention == null) {
              return res.json({product: []});
            } else {
              // console.log(topMention);
              return res.send({product: topMention});
            }
          });
    });

router.route("/getPost/viewPost/:id/:product")
    .get(middleware.checkToken, (req, res)=>{
      Post.findOne({_id: req.params.id}, (err, findPost)=>{
        if (err) {
          return res.json(err);
        } else {
          let product = req.params.product;
          product = product.split("_").join(" ");
          console.log(product);
          Product.findOne({p_name: product}, (err, findProduct)=>{
            if (err) {
              return res.json(err);
            } else {
              console.log(findPost);
              console.log(findProduct);
              return res.send({post: findPost, product: findProduct});
            }
          });
        }
      });
    });

    router.route("/comment").post((req, res) => {
      const comment = Comment({
        username: req.body.username,
        mainpost: req.body.mainpost,
        body: req.body.comment,
      });
      comment
        .save()
        .then(() => {
          return res.json("add comment successfull");
        })
        .catch((err) => {
          return res.status(400).json({ err: err });
        });
    });
    
    // router.route("/getComment/:id").get((req,res)=>{
    //   Comment.find({mainpost:req.params.id}).populate("owner").exec(function(err,findComment) {
    //   let username = Comment("owner.username");
    //   console.log(username);
    //     Profile.find({username:username}).exec(function(err,findOwner) {
    //       if(err){
    //         return res.json(err);
    //       } else {
    //         console.log(findComment);
    //         console.log(findOwner);
    //         return res.send({ comment: findComment , owner: findOwner});
    //       }
    //     })
    //   })
    // })
    router.route("/getSearchPost/:id").get(middleware.checkToken, (req,res)=>{
          var query = req.params.id.toLowerCase()
          //console.log(typeof Post)
          Post.find({product : {$ne : null}},).populate({
              path: 'product',
            }).exec(function(err, result){
                 if(err) {
                    return res.json(err);
                 } else {
                    var i = 0;
                    var my_result = []
                    while(i < result.length){
                    if(result[i].body.includes(query)){
                        my_result.push(result[i]);
//                        console.log(my_result);
                    }
                      else if(result[i].product.length>0){
                            for (let x = 0; x<result[i].product.length; x++ ){
//                            console.log()
                                if(result[i].product[x].p_brand.toLowerCase().includes(query)||result[i].product[x].p_name.toLowerCase().includes(query)){
                                  my_result.push(result[i]);
                                }

                            }
//                            console.log();
//                            console.log(result[i].product[x].p_brand,result[i].product[x].p_name);

                        }

                    i++;
                    }
                    console.log(my_result.length)
                    res.send({ getPost: my_result,
                               length: my_result.length});
                 }
            }
            /*.then(result => console.log(typeof res.json(result))
                    /result.find({$or: [
                    {"product.p_name": {$regex: query, $options:"i"}},
                    {"product.p_nbrand": {$regex: query, $options:"i"}},
                    ],},(err,result)=>{
                                    if(err)return res.json(err);
                                    return res.json({data:result})
                                })*/
           )
        });
    router.route("/getComment/:id").get((req,res)=>{
      Comment.find({mainpost:req.params.id}).exec(function(err,findComment) {
          if(err){
            return res.json(err);
          } else {
            return res.send({ comment: findComment , countComment: findComment.length });
          }
      });
    });

    router.route("/getDataComment/:id").get((req,res)=>{
      Comment.findOne({_id:req.params.id}).exec(function(err, comment){
        if(err){
          console.log(err);
        } else {
          return res.send({ dataComment: comment });
        }
      });
    });

module.exports = router;
