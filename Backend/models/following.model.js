const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Following = Schema(
  {
    email: {
      type: String,
      required: true,
      unique: true,
    },
    listfollowing: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'ListFollowing'
      }
    ]
  }
);

module.exports = mongoose.model("Following", Following);