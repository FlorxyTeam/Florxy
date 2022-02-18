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
      unique: true
    },
    fullname: String,
    DOB: String,
    professor: {
      type: String,
      default: "",
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
    ]
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Profile", Profile);