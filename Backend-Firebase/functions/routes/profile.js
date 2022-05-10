const express = require("express");
// eslint-disable-next-line new-cap
const router = express.Router();
const Profile = require("../models/profile.model");
const Chat = require("../models/chat.model");
const Post = require("../models/post.model");
const Notification = require("../models/notification.model");
const middleware = require("../middleware");


router.route("/getNotificationData").get(middleware.checkToken, (req, res) => {
  console.log(req.decoded.username)
  Notification.find({ username: req.decoded.username }, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});

router.route("/addNotification").post(middleware.checkToken, (req, res) => {
  // eslint-disable-next-line new-cap
  const notification = Notification({
    username: req.decoded.username,
    otherusername: req.body.otherusername,
    type: req.body.type,
    body: req.body.body,
  });
  notification
    .save()
    .then(() => {
      return res.json({ msg: "Notification successfully stored" });
    })
    .catch((err) => {
      return res.status(400).json({ err: err });
    });
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
            console.log("hi null");

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
            console.log("hi null");
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

// router.route("/chatWith/:myusername/:targetusername").post((req,res)=>{
//   Profile.findOneAndUpdate({
//     "username": req.params.myusername,
//     "listmessage.username" : req.params.targetusername,
//   },
//   { $push: {
//     "listmessage.$.message": {
//         message:req.body.message,
//         type:req.body.type,
//         time:req.body.time,
//     }
//   }}, function(err,addChat){
//     if(err){
//       console.log(err);
//     } else {
//       return res.json('add chat succes!!');
//     }
//   });
// });

router.route("/chat").post((req, res) => {
  // eslint-disable-next-line new-cap
  const chat = Chat({
    sender: req.body.sender,
    receiver: req.body.receiver,
    message: req.body.message,
    time: req.body.time
  });
  chat
    .save()
    .then(() => {
      return res.json("add chat successfull");
    })
    .catch((err) => {
      return res.status(400).json({ err: err });
    });
});

router.route("/getChat/:myusername/:targetusername").get((req,res)=>{
  Chat.find({
    $and: [
      { $or: [{sender: req.params.myusername}, {sender: req.params.targetusername}] },
      { $or: [{receiver: req.params.myusername}, {receiver: req.params.targetusername}] }
    ]
  }, (err,chats)=>{
    if(err) {
      console.log(err);
    } else {
      return res.json( { showChat: chats } );
    }
  });
});

// router.route("/chat").post((req, res) => {
//   const profile = Profile({
//     "listmessage.$.username": req.body.targetusername
//   });
//   profile
//     .save()
//     .then(() => {
//       return res.json("add targetusername successfull");
//     })
//     .catch((err) => {
//       return res.status(400).json({ err: err });
//     });
// });

// router.route("/chat/:username").post((req,res)=>{
//   console.log(req.params.username);
//   console.log(req.body.targetusername);
//   Profile.findOneAndUpdate({ username: req.params.username }, { $push:{ listmessage: { username: req.body.targetusername }}}, function(err, chatWith){
//     if(err) {
//       console.log(err);
//     } else {
//       return res.json("add targetusername successfull");
//     }
//   });
// });


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

router.route("/add").post(middleware.checkToken, (req, res) => {
  // eslint-disable-next-line new-cap
  const profile = Profile({
    username: req.decoded.username,
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
  Profile.findOne({ username: req.decoded.username }, (err, result) => {
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
    console.log("Username - Checked");
})

router.route("/PostAndReply/:username").get((req,res)=>{
  Post.find({username: req.params.username}, (err, result)=>{
    if(err){
      return res.json(err);
    } else {
      return res.send({ myPost: result });
    }
  })
})

router.route("/otherPostAndReply/:username").get((req,res)=>{
  Post.find({username: req.params.username}, (err, result)=>{
    if(err){
      return res.json(err);
    } else {
      Profile.find({username: req.params.username}, (err,findProfile)=>{
        if(err){
          return res.json(err);
        } else {
          return res.send({ anotherPost: result, anotherProfile: findProfile });
        }
      })
    }
  })
})

router.route("/getData").get(middleware.checkToken, (req, res) => {
  console.log(req.decoded.username)
  Profile.findOne({ username: req.decoded.username }, (err, result) => {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});

router.route("/getSaveProduct").get(middleware.checkToken, (req, res) => {
  console.log(req.decoded.username)
  Profile.findOne({ username: req.decoded.username }).populate("saveproduct").exec(function(err, result) {
    if (err) return res.json({ err: err });
    if (result == null) return res.json({ data: [] });
    else return res.json({ data: result });
  });
});

router.route("/getUsername/:email").get((req, res) => {
  console.log(req.params.email)
  Profile.find({ email: req.params.email }, (err, result) => {
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

router.route("/getFavPost/:id").get((req,res) => {
  Profile.findOne({_id:req.params.id}).populate("favorite").exec(function(err, fav) {
    if(err){
        return res.json(err);
    }else{
        console.log(fav);
        return res.send({favPost: fav});
    }
  });
})

router.route("/update").patch(middleware.checkToken, (req, res) => {
  let profile = {};
  Profile.findOne({ username: req.decoded.username }, (err, result) => {
    if (err) {
      profile = {};
    }
    if (result != null) {
      profile = result;
    }
  });
  Profile.findOneAndUpdate(
    { username: req.decoded.username },
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

router.route("/update/profile").patch(middleware.checkToken, (req, res) => {
  let profile = {};
  Profile.findOne({ username: req.decoded.username }, (err, result) => {
    if (err) {
      profile = {};
    }
    if (result != null) {
      profile = result;
    }
  });
  Profile.findOneAndUpdate(
    { username: req.decoded.username },
    {
      $set: {
           img: req.body.img ? req.body.img : profile.img,
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

router.route("/getSearchUser/:id").get(middleware.checkToken, (req, res)=>{
  const query = req.params.id
  Profile.find({$or: [{username: {$regex: query, $options:"i"}},
                      {fullname: {$regex: query, $options:"i"}},],}, (err, result)=>{
    if (err) return res.json(err);
    return res.json({getUser: result});
  });
});

router.route("/getAllProfile").get(middleware.checkToken, (req, res)=>{
  Profile.find({}, (err, result)=>{
    if (err) return res.json(err);
    return res.json({data: result});
  });
});

module.exports = router;
