const express = require("express");
// eslint-disable-next-line new-cap
const router = express.Router();
const products = require("../models/product.model");

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

module.exports = router;
