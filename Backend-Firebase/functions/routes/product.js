const express = require("express");
// eslint-disable-next-line new-cap
const router = express.Router();
const products = require("../models/product.model");
const middleware = require("../middleware");
const Post = require("../models/post.model");

router.route("/add").post((req, res)=> {
  // eslint-disable-next-line new-cap
  const product = products({
    p_name: req.body.p_name,
    p_brand: req.body.p_brand,
    p_desc: req.body.p_desc,
    p_img: req.body.p_img,
    ing_name: req.body.ing_name,
    ing_met: req.body.ing_met,
    ing_irr: req.body.ing_irr,
    ing_rate: req.body.ing_rate,

  });
  console.log("hi");
  product
      .save()
      .then(() => {
        return res.json({msg: "profile successfully stored"});
      })
      .catch((err) => {
        return res.status(400).json({err: err});
      });
});
// list of brand
router.route("/brand").get(middleware.checkToken, (req, res) => {
    products.find({}).distinct("p_brand", (err, result) => {
        console.log("list of brand");
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_brand: req.body.p_brand,
        })
    })
});
// go to brandOverview
router.route("/brand/:p_brand").get(middleware.checkToken, (req, res) => {
    products.find({p_brand: req.params.p_brand},(err, result) => {
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_brand: req.params.p_brand,
        })
    })
});




// go to ProductOverview
router.route("/:_id").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params._id}, (err, result) => {
        console.log("ProductOverview");
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_id: req.params._id,
        })
    })
});

// Total brand
router.route("/brand").get(middleware.checkToken, (req, res) => {
    products.find({}).distinct("p_brand", (err, result) => {
        console.log("list of brand");
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_brand: req.body.p_brand,
        })
    })
});

// brandOverview
router.route("/brand/:p_brand").get(middleware.checkToken, (req, res) => {
    products.find({p_brand: req.params.p_brand}, (err, result) => {
        if(err) res.status(500).json({msg: err});
                  res.json({
                               data: result,
                               p_brand: req.params.p_brand,
                      })
    });
});


// top 5 mentions
router.route("/topmention/brand/:p_brand").get(middleware.checkToken, (req, res ) =>{
     products.find({p_brand: req.params.p_brand}).sort({mention: -1}).limit(5).exec(function(err, mention){
     if(err) res.status(500).json({msg: err});
                       res.json({
                                    data: mention,
                                    p_brand: req.params.p_brand,
                           })
     });
});

// top 5 reviews
router.route("/topreview/brand/:p_brand").get(middleware.checkToken, (req, res ) =>{
     products.find({p_brand: req.params.p_brand}).sort({mention: -1}).limit(5).exec(function(err, review){
     if(err) res.status(500).json({msg: err});
                       res.json({
                                    data: review,
                                    p_brand: req.params.p_brand,
                           })
     });
});

// product Detail
router.route("/:_id").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params._id}, (err, result) => {
        console.log("ProductOverview");
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_id: req.params._id,
        })
    })
});

// Interesting review and mention
router.route("/post/interestingreview/:_id").get(middleware.checkToken, (req, res ) =>{
     Post.find({product: req.params._id, type:"review" } ).sort({rating: -1}).exec(function(err, result){
        if(err) res.status(500).json({msg: err});
                res.json({
                    interesting: result,
                    p_id: req.params._id,
                })

     });
});


// compare 2 products
router.route("/compare/:p_id1/:p_id2").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params.p_id1}, (err, result1) => {
        console.log("Compare 2 products.");
        if(err) res.status(500).json({msg: err});
         products.findOne({_id: req.params.p_id2}, (err, result2) => {

          res.json({
                     data: result1,result2

                 })
         });

    })
});


// compare 3 products
router.route("/compare/:p_id1/:p_id2/:p_id3").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params.p_id1}, (err, result1) => {
        console.log("Compare 3 products.");
        if(err) res.status(500).json({msg: err});
         products.findOne({_id: req.params.p_id2}, (err, result2) => {
            if(err) res.status(500).json({msg: err});
             products.findOne({_id: req.params.p_id3}, (err, result3) => {
              if(err) res.status(500).json({msg: err});
             res.json({
                         data: [result1, result2, result3],

              });

             });

         });

    })
});

router.route("/getSearchProduct/:id").get(middleware.checkToken,(req,res)=>{
                print("getSearchProduct")
                var query = req.params.id
                product.find({$or: [{p_name: {$regex: query, $options:"i"}},
                                    {p_brand: {$regex: query, $options:"i"}},],},
                (err,result)=>{
                    if(err)return res.json(err);
                    return res.json({getProduct : result})
                });
            });

module.exports = router;
