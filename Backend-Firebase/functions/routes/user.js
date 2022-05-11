const express = require("express");
const config = require("../config");
const jwt = require("jsonwebtoken");
const middleware = require("../middleware");
const User = require("../models/users.model");
const bcrypt = require("bcryptjs");

// eslint-disable-next-line new-cap
const router = express.Router();

router.route("/:email").get(middleware.checkToken, (req, res) => {
  User.findOne({email: req.params.email}, (err, result) => {
    if (err) res.status(500).json({msg: err});
    return res.json({
      data: result,
      email: req.params.email,
    });
  });
});

router.route("/checkemail/:email").get((req, res) => {
  User.findOne({email: req.params.email}, (err, result) => {
    if (err) res.status(500).json({msg: err});
    if (result !== null) {
      return res.json({
        Status: true,

      });
    } else {
      return res.json({
        Status: false,

      });
    }
  });
  console.log("Email - Checked");
});


router.route("/login-email").post(async (req, res) => {
  User.findOne({email: req.body.email},async (err, result) => {
    if (err) return res.status(500).json({msg: err});
    if (result === null) {
      return res.status(403).json("Email or password is incorrect");
    }

    console.log(req.body.password);

    const isMatch = await bcrypt.compare(req.body.password,result.password);

    if (!isMatch) {
      return res.status(400).json("Invalid credentials");
    }
    if (isMatch) {
      // implement the JWT
      const token = jwt.sign({username: req.body.username}, config.key, {
        // expiresIn: "24h",
      });
      res.json({
        token: token,
        msg: "success",
      });
    } else {
      return res.status(400).json("password or Email is incorrect");
    }
  });
});

router.route("/register").post( async (req, res) => {
  console.log("inside the register");
  
  
  const user = new User({
    email: req.body.email,
    password: req.body.password,
    username: req.body.username,
  });
  const salt = await bcrypt.genSalt();
  const Hashpassword = await bcrypt.hash(user.password,salt);
  user.password = Hashpassword;
  console.log(user.password);

 
  console.log(user.password);
  user
      .save()
      .then(() => {
        console.log("user registered");
        res.status(200).json({msg: "User Successfully Registered"});
      })
      .catch((err) => {
        res.status(403).json({msg: err});
      });
});


router.route("/login-google").post((req, res) => {
  User.findOne({google: req.body.google}, (err, result) => {
    if (err) return res.status(500).json({msg: err});
    if (result === null) {
      return res.status(403).json("Email or password is incorrect");
    }
    console.log(result.username);
      // implement the JWT
      const token = jwt.sign({username: result.username}, config.key, {
        // expiresIn: "24h",
      });
      res.json({
        token: token,
        username: result.username,
        msg: "success",
      });
  });
});

router.route("/getUsername/:email").get((req, res) => {
  console.log(req.params.email)
  User.findOne({ email: req.params.email }, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});



router.route("/register/google").post((req, res) => {
  console.log("inside the register");
  const user = new User({
    google: req.body.google,
    username: req.body.username,
    email: "",
    password: ""
  });
  user
      .save()
      .then(() => {
        console.log("user registered");
        res.status(200).json({msg: "User Successfully Registered"});
      })
      .catch((err) => {
        res.status(403).json({msg: err});
      });
});

router.route("/update/:email").patch(middleware.checkToken, (req, res) => {
  User.findOneAndUpdate(
      {email: req.params.email},
      {$set: {password: req.body.password}},
      (err, result) => {
        if (err) return res.status(500).json({msg: err});
        const msg = {
          msg: "password successfully updated",
          email: req.params.email,
        };
        return res.json(msg);
      }
  );
});
router.route("/delete/:email").delete(middleware.checkToken, (req, res) => {
  User.findOneAndDelete({email: req.params.email}, (err, result) => {
    if (err) return res.status(500).json({msg: err});
    const msg = {
      msg: "User deleted",
      email: req.params.email,
    };
    return res.json(msg);
  });
});

module.exports = router;
