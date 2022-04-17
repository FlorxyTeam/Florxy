const mongoose = require("mongoose");
const schema = mongoose.Schema;

const Post = schema(
    {
      pinnedcomment: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Comment",
      },
      comment: [
        {
          type: mongoose.Schema.Types.ObjectId,
          ref: "Comment",
        },
      ],
      favorite: [
        {
          username: {
            type: String,
          },
        },
      ],
      type: String,
      coverImage: [
        {
          type: String,
          default: "",
        },
      ],
      body: String,
      product: [
        {
          type: mongoose.Schema.Types.ObjectId,
          ref: "Product",
        },
      ],
      archive: {
      type: Boolean,
      default: false,
      },
      username: String,
      rating: {
        type: String,
        default: '',
      },
    },
    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Post", Post);
