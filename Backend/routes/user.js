const express = require("express");
const { json } = require("express/lib/response");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require('../middleware');
const User = require("../models/users.model");

const router = express.Router();

router.route("/:email").get(middleware.checkToken, (req, res) => {
  User.findOne({ email: req.params.email }, (err, result) => {
    if (err) res.status(500).json({ msg: err });
    return res.json({
      data: result,
      email: req.params.email,
    });
  });
});

router.route("/checkemail/:email").get((req,res)=>{
    User.findOne({ email: req.params.email }, (err, result) => {
        if (err) res.status(500).json({ msg: err });
        if(result!==null){
            return res.json({
                Status: true,
              
            });
        }
        else return res.json({
            Status: false,
          
        })
        
      });
      console.log('Email - Checked')
})

router.route("/login").post((req, res) => {
  User.findOne({ email: req.body.email }, (err, result) => {
    if (err) return res.status(500).json({ msg: err });
    if (result === null) {
      return res.status(403).json("Email or password is incorrect");
    }
    if (result.password === req.body.password) {
      //implement the JWT
      let token = jwt.sign({ email: req.body.email }, config.key, {
        // expiresIn: "24h",
      });
      res.json({
        token: token,
        msg: "success",
      });
    } else {
      res.status(403).json("password or Email is incorrect");
    }
  });
});

router.route("/register").post((req, res) => {
  console.log("inside the register");
  const user = new User({
    email: req.body.email,
    password: req.body.password,
  });
  user
    .save()
    .then(() => {
      console.log("User Registered");
      res.status(200).json("Added");
    })
    .catch((err) => {
      res.status(403).json({ msg_error: err });
    });
  res.json("registered");
});

router.route("/update/:email").patch(middleware.checkToken,(req, res) => {
  User.findOneAndUpdate(
    { email: req.params.email },
    { $set: { password: req.body.password } },
    (err, result) => {
      if (err) return res.status(500).json({ msg: err });
      const msg = {
        msg: "password successfully updated",
        email: req.params.email,
      };
      return res.json(msg);
    }
  );
});
router.route("/delete/:email").delete(middleware.checkToken,(req, res) => {
  User.findOneAndDelete({ email: req.params.email }, (err, result) => {
    if (err) return res.status(500).json({ msg: err });
    const msg = {
      msg: "User deleted",
      email: req.params.email,
    };
    return res.json(msg);
  });
});

module.exports = router;
