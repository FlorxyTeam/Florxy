const express = require("express");
const router = express.Router();
const Product = require("../models/product.model");
const middleware = require("../middleware");
const multer = require("multer");
const path = require("path");
const e = require("express");
const req = require("express/lib/request");

router.route("/add").post((req,res)=> {
  const product = Product({
    p_name: req.body.p_name,
    p_brand: req.body.p_brand,
    p_desc: req.body.p_desc,
    p_img: req.body.p_img,
    ing_name : req.body.ing_name,
    ing_met : req.body.ing_met,
    ing_irr : req.body.ing_irr,
    ing_rate : req.body.ing_rate,

  });
  console.log('hi')
  product
    .save()
    .then(() => {
      return res.json({ msg: "profile successfully stored" });
    })
    .catch((err) => {
      return res.status(400).json({ err: err });
    });
});


//list of brand
router.route("/brand").get(middleware.checkToken, (req, res) => {
    Product.find().distinct('p_brand', (err, result) => {
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_brand: req.body.p_brand,
        })
    })
});

//go to brandOverview
router.route("/brand/:p_brand").get(middleware.checkToken, (req, res) => {
    Product.find({p_brand: req.params.p_brand}, (err, result) => {
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_brand: req.params.p_brand,
        })
    })
});


//go to ProductOverview
router.route("/:_id").get(middleware.checkToken, (req, res) => {
    Product.findOne({_id: req.params._id}, (err, result) => {
        if(err) res.status(500).json({msg: err});
        res.json({
            data: result,
            p_id: req.params._id,
        })
    })
});








module.exports = router;
