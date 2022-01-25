const express = require("express");
const router = express.Router();
const Profile = require("../models/profile.model");
const middleware = require("../middleware");
const multer = require("multer");
const path = require("path");
const e = require("express");
const req = require("express/lib/request");

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./uploads");
  },
  filename: (req, file, cb) => {
    cb(null, req.decoded.email + ".jpg");
  },
});

const fileFilter = (req, file, cb) => {
  if (file.mimetype == "image/jpeg" || file.mimetype == "image/png") {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 6,
  },
  // fileFilter: fileFilter,
});

//adding and update profile image
router
  .route("/add/image")
  .patch(middleware.checkToken, upload.single("img"), (req, res) => {
    Profile.findOneAndUpdate(
      { email: req.decoded.email },
      {
        $set: {
          img: req.file.path,
        },
      },
      { new: true },
      (err, profile) => {
        if (err) return res.status(500).send(err);
        const response = {
          message: "image added successfully updated",
          data: profile,
        };
        return res.status(200).send(response);
      }
    );
  });

router.route("/add").post(middleware.checkToken, (req, res) => {
  const profile = Profile({
    email: req.decoded.email,
    username: req.body.username,
    fullname: req.body.fullname,
    DOB: req.body.DOB,
  });
  profile
    .save()
    .then(() => {
      return res.json({ msg: "profile successfully stored" });
    })
    .catch((err) => {
      return res.status(400).json({ err: err });
    });
});

router.route("/checkProfile").get(middleware.checkToken, (req, res) => {
  Profile.findOne({ email: req.decoded.email }, (err, result) => {
    if (err) return res.json({ err: err });
    else if (result == null) {
      return res.json({ status: false });
    } else {
      return res.json({ status: true });
    }
  });
});

router.route("/checkusername/:username").get((req,res)=>{
  Profile.findOne({ username: req.params.username }, (err, result) => {
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
    console.log('Username - Checked')
})

router.route("/getData").get(middleware.checkToken, (req, res) => {
  Profile.findOne({ email: req.decoded.email }, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});

router.route("/update").patch(middleware.checkToken, async (req, res) => {
  let profile = {};
  Profile.findOne({ email: req.decoded.email }, (err, result) => {
    if (err) {
      profile = {};
    }
    if (result != null) {
      profile = result;
    }
  });
  await Profile.findOneAndUpdate(
    { email: req.decoded.email },
    {
      $set: {
           fullname: req.body.fullname ? req.body.fullname : profile.fullname,
           bio: req.body.bio ? req.body.bio : profile.bio,
      },
    },
    { new: true },
    (err, result) => {
      if (err) return res.json({ err: err });
      if (result == null) return res.json({ data: [] });
      else return res.json({ data: result });
    }
  );
});
module.exports = router;
