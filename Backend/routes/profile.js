const express = require("express");
const router = express.Router();
const Profile = require("../models/profile.model");
const Follower = require("../models/follower.model");
const Following = require("../models/following.model");
const middleware = require("../middleware");
const multer = require("multer");
const path = require("path");
const e = require("express");
const req = require("express/lib/request");
const mongoose = require("mongoose");
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


router.route("/followercheck/:username/:myusername").get(middleware.checkToken, (req,res)=>{
    Profile.findOne({
        "username": req.params.username,
        "listfollower.username" : req.params.myusername,

    }, function(err, docs){
    console.log(req.params.username)
    console.log(req.params.myusername)
         if(docs == null && req.params.username != req.params.myusername){
                     return res.json({
                         Status: true,

                     });
                 }
                 else return res.json({
                     Status: false,

                 })

    });
});
router.route("/addfollower/:username/:myusername").patch(middleware.checkToken, (req,res,next)=>{
    Profile.findOne({
        "username": req.params.username,
        "listfollower.username" : req.params.myusername,

    }, function(err, docs){
    console.log(req.params.username)
    console.log(req.params.myusername)
         if(docs == null && req.params.username != req.params.myusername){
            console.log('hi null')

            Profile.findOneAndUpdate(
                    {
                    username: req.params.username,

                     },
                    {
                    follower: req.body.follower,
                      $push: {
                        listfollower:
                        {
                            img:req.body.myimg,
                            fullname:req.body.myfullname,
                            username:req.params.myusername,
                        },

                      },
                    },
                    {
                    new: true,
                    upsert: true
                     },
                    (err, profile) => {
                      if (err) return res.status(500).send(err);

                  Profile.findOneAndUpdate(
                      {
                      username: req.params.myusername,

                       },
                      {
                      following: req.body.following,

                         $push: {
                            listfollowing:
                            {
                                img:req.body.img,
                                fullname:req.body.fullname,
                                username:req.params.username,
                            },

                          },
                      },
                      {
                      new: true,
                      upsert: true
                       },
                      (err, profile) => {
                        if (err) return res.status(501).send(err);

                        const response = {
                          message: "following added",
                          data: profile,
                        };
                        return res.status(201).send(response);
                      }
                    );
                    }
                  );




            }
         else{
            const response = {
                message: "you did it",
              };
              return res.status(202).send(response);
         }

    });
});
router.route("/unfollower/:username/:myusername").patch(middleware.checkToken, (req,res,next)=>{
    Profile.findOne({
        "username": req.params.username,
        "listfollower.username" : req.params.myusername,

    }, function(err, docs){
    console.log(req.params.username)
    console.log(req.params.myusername)
         if(docs == null && req.params.username != req.params.myusername){
            console.log('hi null')
              const response = {
                message: "you did not follow",
              };
              return res.status(200).send(response);
            }
         else{
         Profile.findOneAndUpdate(
              {
              username: req.params.username,
               },
              {
              follower: req.body.follower,
                $pull: {
                  listfollower:
                  {
                      username:req.params.myusername,
                  },

                },
              },
              { new: true,
               upsert: true},
              (err, profile) => {
                if (err) return res.status(500).send(err);
         Profile.findOneAndUpdate(
                  {
                  username: req.params.myusername,
                   },
                  {
                  following: req.body.following,
                    $pull: {
                      listfollowing:
                      {
                          username:req.params.username,
                      },

                    },
                  },
                  { new: true,
                   upsert: true},
                  (err, profile) => {
                    if (err) return res.status(501).send(err);

                    const response = {
                      message: "following removed",
                      data: profile,
                    };
                    return res.status(201).send(response);
                  }
                );
              }
            );


         }

    });
});





router.route("/addprofessor/:username").patch(middleware.checkToken, (req,res)=>{
    console.log(req.params.username)
    Profile.findOneAndUpdate(
            { username: req.params.username },
            {
              professor: req.body.professor,
            },
            { new: true },
            (err, profile) => {
              if (err) return res.status(500).send(err);
              const response = {
                message: "professor added",
                data: profile,
              };
              return res.status(200).send(response);
            }
          );
});
router.route("/addinfluencer/:username").patch(middleware.checkToken, (req,res)=>{
    console.log(req.params.username)
    Profile.findOneAndUpdate(
            { username: req.params.username },
            {
              influencer: req.body.influencer,
            },
            { new: true },
            (err, profile) => {
              if (err) return res.status(500).send(err);
              const response = {
                message: "influencer added",
                data: profile,
              };
              return res.status(200).send(response);
            }
          );
});

router.route("/addintfollowing").post(middleware.checkToken, (req, res) => {
    console.log(req.body.username)
    console.log(req.body.following)
   Profile.findOneAndUpdate(
          {
          username: req.body.username,
           },
          {
            following: req.body.following,

          },
          {
              new: true,
              upsert: true
            },
          (err, profile) => {
            if (err) return res.status(500).send(err);

            const response = {
              message: "follower more added",
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

router.route("/getOtherData/:username").get(middleware.checkToken, (req, res) => {
  Profile.findOne({username: req.params.username }, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
//    res.json({msg:req.params.username})
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
