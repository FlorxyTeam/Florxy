const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Profile = schema(
    {
      username: {
        type: String,
        required: true,
        unique: true,
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
          ref: "Post",
        },
      ],
      listfollower: [
        {
          img: {
            type: String,
            default: "",
          },
          fullname: {
            type: String,
          },
          username: {
            type: String,
            unique: true,
          },
        },
      ],
      listfollowing: [
        {
          img: {
            type: String,
            default: "",
          },
          fullname: {
            type: String,
          },
          username: {
            type: String,
            unique: true,
          },
        },
      ],
      saveproduct: [
        {
          type: mongoose.Schema.Types.ObjectId,
          ref: "Product",
        }
      ],
      pinned: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Pinned",
      },
      notification: [
        {
          type: mongoose.Schema.Types.ObjectId,
          ref: "notification",
        }
      ],
    },

    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Profile", Profile);
