const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Profile = Schema(
  {
    email: {
      type: String,
      required: true,
      unique: true,
    },
    username: {
      type: String,
      required: true,
      unique: true
    },
    fullname: String,
    DOB: String,
    professor: {
      type: String,
      default: "",
    },
    follower:{
      type: Number,
      default: 0,
    },
    following:{
      type: Number,
      default: 0,
    },
    influencer: {
      type: String,
      default: "",
    },
    bio: {
      type: String,
      default: "",
    },
    img: {
      type: String,
      default: "",
    },
    favorite: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Post'
      }
    ],
    listfollower: [
          {
          img: {
            type: String,
             default:'',
          },
           fullname: {
              type: String,
               unique: true,
            },
          username: {
            type: String,
            unique: true,
          },
      }
    ],
    listfollowing: [
          {
          img: {
              type: String,
              default:'',
            },
          fullname: {
              type: String,
              unique: true,
           },
          username: {
              type: String,
              unique: true,
          },
          // currentMessage: {
          //     type: String,
          //     default: ''
          // }
      }
    ],
    listmessage: [
      {
        username: String,
        message: [
          {
            message: {
              type: String
            },
            type: {
              type: String
            },
            time: {
              type: String
            }
          }
        ] 
      }
    ]
  },



  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Profile", Profile);