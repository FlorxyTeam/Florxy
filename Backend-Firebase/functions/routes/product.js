const express = require("express");
// eslint-disable-next-line new-cap
const router = express.Router();
const products = require("../models/product.model");
const middleware = require("../middleware");
const Post = require("../models/post.model");

router.route("/add").post((req, res)=> {
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

//Total brand
router.route("/brand").get(middleware.checkToken, (req, res) => {
    products.find({}).distinct('p_brand', (err, result) => {
        console.log("list of brand");
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_brand: req.body.p_brand,
        })
    })
});

//brandOverview
router.route("/brand/:p_brand").get(middleware.checkToken, (req, res) => {
    products.find({p_brand: req.params.p_brand}, (err, result) => {
        if(err) res.status(500).json({msg: err});

        products.find({p_brand: req.params.p_brand}).sort({mention: -1}).limit(5).exec(function(err, topmention){
             if(err) res.status(500).json({msg: err});

             products.find({p_brand: req.params.p_brand}).sort({review: -1}).limit(5).exec(function(err, topreview){
                  if(err) res.status(500).json({msg: err});

                  res.json({
                               data: result,
                               topmention: topmention,
                               topreview:topreview,
                               p_brand: req.params.p_brand,
                      })
              });
        });

    });
});

//product Detail
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

//Interesting review and mention
router.route("/:refproduct").get(middleware.checkToken, (req, res) => {
    Post.find({refproduct: req.params.refproduct}, (err, result) => {
        console.log("ProductOverview");
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
           refproduct: req.params.refproduct,
        })
    })
});

//compare 2 products
router.route("/compare/:p1_id/:p2_id").get(middleware.checkToken, (req, res) => {
    products.find({p1_id: req.params._id}, (err, result1) => {
        console.log("Compare 2 products.");
        if(err) res.status(500).json({msg: err});
         products.find({p2_id: req.params._id}, (err, result2) => {

          res.json({
                     product1: result1,
                     product2: result2,
                     _id: req.params._id,
                 })
         });

    })
});


//compare 3 products
router.route("/compare/:p1_id/:p2_id/:p3_id").get(middleware.checkToken, (req, res) => {
    products.find({p1_id: req.params._id}, (err, result1) => {
        console.log("Compare 3 products.");
        if(err) res.status(500).json({msg: err});
         products.find({p2_id: req.params._id}, (err, result2) => {
            if(err) res.status(500).json({msg: err});
             products.find({p2_id: req.params._id}, (err, result3) => {
              if(err) res.status(500).json({msg: err});
             res.json({
                         product1: result1,
                         product2: result2,
                         product3: result3,

              });

             });

         });

    })
});


module.exports = router;
