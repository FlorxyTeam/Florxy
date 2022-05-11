/* eslint-disable new-cap */
const express = require("express");
// eslint-disable-next-line new-cap
const router = express.Router();
const products = require("../models/product.model");
const middleware = require("../middleware");
const Post = require("../models/post.model");
const Ingredient = require("../models/ingredient.model");
const Brand = require("../models/brand.model");
const Requestproduct = require("../models/requestproduct.model");
const Profile = require("../models/profile.model");


router.route("/getProductData/:id").get(middleware.checkToken, (req, res) => {
  console.log(req.decoded.username)
  products.findOne({ _id: req.params.id }, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});

router.route("/getIngredientInfo/:id").get( (req, res) => {
  Ingredient.findOne({ _id: req.params.id }).exec(function(err, result){
    if(err) {
      return console.log(err);
    } else {
      return res.json({ ingredient: result });
    }
  });
});

router.route("/getIngredientInfoFromName/:name").get( (req, res) => {
  Ingredient.findOne({ name: req.params.name }).exec(function(err, result){
    if(err) {
      return console.log(err);
    } else {
      return res.json({ ingredient: result });
    }
  });
});

router.route("/add/brand").post((req, res)=> {
  // eslint-disable-next-line new-cap
  Brand.find({name:req.body.name},(err, result) =>{
    if(err) res.status(500).json({msg: err});
    if(result.length == 0){
      const brand = Brand({
        name: req.body.name,
      });
      brand.save()
            .then(() => {
              return res.json({msg: "brand successfully stored"});
            })
            .catch((err) => {
              return res.status(400).json({err: err});
            });
  }
  else{
    return res.json({msg: "brand already had"});
  }
  });
});


router.route("/add").post((req, res)=> {
  // eslint-disable-next-line new-cap
  const product = products({
    p_name: req.body.p_name,
    p_brand: req.body.p_brand,
    p_desc: req.body.p_desc,
    p_img: req.body.p_img,
    ing_id: req.body.ing_id,
    p_cate: req.body.p_cate,

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
router.route("/add/ing").post((req, res)=> {
  Ingredient.find({name:req.body.name}, (err, result) =>{
  console.log(result.length == 0);
    if(err) res.status(500).json({msg: err});
    if(result.length == 0){
      const ingredient = Ingredient({
        name: req.body.name,
        rate: req.body.rate,
        calling: req.body.calling,
        func: req.body.func,
        irr: req.body.irr,
        come: req.body.come,
        cosing: req.body.cosing,
        quick: req.body.quick,
        detail: req.body.detail,
        proof: req.body.proof,
        link: req.body.link,
      });
      ingredient.save().then((value) => {
                        return res.json({result: value._id});
                      })
                      .catch((err) => {
                        return res.status(400).json({err: err});
                      });
      }
    else{
        res.json({
        result: result[0]._id
       })
    }
  })
});

router.route("/add/ing/check").post((req, res)=> {
  Ingredient.find({name:req.body.name}, (err, result) =>{
  console.log(result.length == 0);
    if(err) res.status(500).json({msg: err});
    if(result.length == 0){
      res.json({
      result: false
      })
    }
    else{
        res.json({
        result: true
       })
    }
  })
});

// list of brand
router.route("/Allbrand/search").get((req, res) => {
  products.aggregate([
                {"$group" : {_id:"$p_brand", count:{$sum:1}}},

     ]).exec(function ( err,result ) {
          if(err)return res.json(err);
          return res.json(result)
       });
});


// brand and list
router.route("/brand").get((req, res) => {
  products.aggregate([
                {"$group" : {_id:"$p_brand", count:{$sum:1}}},

     ]).sort({count: -1}).limit(5).exec(function ( err,result ) {
          if(err)return res.json(err);
          return res.json({data : result})
       });
});


// go to brandOverview
router.route("/brand/:p_brand").get(middleware.checkToken, (req, res) => {
    products.find({p_brand: req.params.p_brand},(err, result) => {
        if(err) res.status(500).json({msg: err});
        res.json({
            product: result,
            p_brand: req.params.p_brand,
        })
    })
});



// go to ProductOverview
router.route("/:_id").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params._id}, (err, result) => {
        console.log("ProductOverview");
        if(err) res.status(500).json({msg: err});
        else return res.json({
            data: result,
            p_id: req.params._id,
        })
    })
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
     products.find({p_brand: req.params.p_brand}).sort({rating: -1}).limit(5).exec(function(err, review){
     if(err) res.status(500).json({msg: err});
       res.json({
            data: review,
            p_brand: req.params.p_brand,
        })
     });
});


// Update rating
router.route("/updaterating/:_id").patch(middleware.checkToken, (req, res ) =>{
    let post = {};
    let rate = 0;
    let num = 0;
     Post.find({product: req.params._id, type:"review" } ).sort({rating: -1}).exec(function(err, result){
        if(err) {
            res.status(500).json({msg: err});
        }else{
            post = result;
            console.log(post);
             for(let i=0;i < post.length;i++){
                rate = rate + parseFloat(post[i].rating);
//                console.log(post[0].rating);
                num = num+1;
             }
             rate = rate/post.length;
             rate = parseFloat(rate).toFixed(1);
             console.log(rate);
             products.findOneAndUpdate(
                    {_id: req.params._id},
                    {
                     $set: {
                         rating: rate,
                         numReview: num,
                     },
                    },
                     { new: true },
                        (err, result) => {
                          if (err) return res.json({ err: err });
                          if (result == null) return res.json({ data: [] });
                          else return res.json({ data: result });
                    }
                  );
        }
     });

});



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
router.route("/compare2/:id1/:id2").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params.id1}, (err, result1) => {
        console.log("Compare 2 products.");
        if(err) {
            res.status(500).json({msg: err});
        }else {
//        res.json({data: result1});
            products.findOne({_id: req.params.id2}, (err, result2) => {
                     if(err){
                      res.status(500).json({msg: err});
                     }else{
                         res.json({
                           product: [result1, result2],

                         });
                     }
            });
        }


    })
});


// compare 3 products
router.route("/compare3/:p_id1/:p_id2/:p_id3").get(middleware.checkToken, (req, res) => {
    products.findOne({_id: req.params.p_id1}, (err, result1) => {
        if(err) res.status(500).json({msg: err});
         products.findOne({_id: req.params.p_id2}, (err, result2) => {
            if(err) res.status(500).json({msg: err});
             products.findOne({_id: req.params.p_id3}, (err, result3) => {
              if(err) res.status(500).json({msg: err});
             res.json({
                         product: [result1, result2, result3],

              });

             });

         });

    })
});

router.route("/getAllProductData/All").get(middleware.checkToken, (req, res) => {
  products.find({}, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});

router.route("/getSearchProduct/:id").get(middleware.checkToken, (req, res)=>{
  const query = req.params.id
  products.find({$or: [{p_name: {$regex: query, $options:"i"}},
                      {p_brand: {$regex: query, $options:"i"}},],}, (err, result)=>{
    if (err) return res.json(err);
    return res.json({getProduct: result});
  });
});


 router.route("/deleteProduct/:brand").get((req,res)=>{
  products.deleteMany({ p_brand: req.params.brand }).exec(function(err, result){
    if(err){
      return console.log(err);
    } else {
      return res.json("delete product success");
    }
  });
});


 router.route("/request").post(middleware.checkToken,(req, res)=> {
   // eslint-disable-next-line new-cap
   const requestproduct = new Requestproduct({
    productview: req.body.productview,
     p_name: req.body.p_name,
     p_brand: req.body.p_brand,
     p_desc: req.body.p_desc,
     p_img: req.body.p_img,
     ing_id: req.body.ing_id,
     rating: req.body.rating,
     numReview: req.body.numReview
   });
   console.log("Request");
   requestproduct
       .save()
       .then(() => {
         return res.json({msg: "Request successful!"});
       })
       .catch((err) => {
         return res.status(400).json({err: err});
       });
 });

 router.route("/save/:id").post(middleware.checkToken, (req, res)=>{
   // res.json(req.params.id);
   Profile.findOneAndUpdate({_id: req.params.id},
       {$push: {
        saveproduct: req.body.saveproduct}}, function(err, SaveProduct) {
         console.log(req.params.id);
         if (err) {
           return res.json(err);
         } else {
            return res.json("save succes!!");
         }
       });
 });


 router.route("/unsave/:id").post(middleware.checkToken, (req, res)=>{
   // res.json(req.params.id);
   Profile.findOneAndUpdate({_id: req.params.id},
       {$pull: {
        saveproduct: req.body.saveproduct}}, function(err, SaveProduct) {
         console.log(req.params.id);
         if (err) {
           return res.json(err);
         } else {
            return res.json("unsave succes!!");
         }
       });
 });

router.route("/view/productoverview/:username").get(middleware.checkToken, (req, res) => {
    Profile.findOne({username: req.params.username}, (err, result) => {
        console.log("I'm here");
        if(err) res.status(500).json({msg: err});
        else return res.json({
            data: result,
        })
    })
});




module.exports = router;
