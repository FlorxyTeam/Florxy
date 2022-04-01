const mongoose = require("mongoose");
const schema = mongoose.Schema;

const Post = schema(
    {
      email: String,
      username: String,
      fullname: String,
      professor: {
        type: String,
        default: "",
      },
      influencer: {
        type: String,
        default: "",
      },
      img: {
        type: String,
        default: "",
      },
      refproduct: {
        type: String,
        default: "",
      },
      type: String,
      refbrand: {
        type: String,
        default: "",
      },
      body: String,
      coverImage: [
        {
          type: String,
          default: "",
        },
      ],
      comment: {
        type: Number,
        default: "0",
      },
      favorite: {
        type: Number,
        default: "0",
      },
      rating: {
        type: Number,
        default: "",
      },
      forwho: {
        type: String,
        default: "Everyone",
      },
    },
    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Post", Post);
