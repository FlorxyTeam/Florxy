const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Follower = Schema(
  {
    email: {
      type: String,
      required: true,
      unique: true,
    },
    listfollower: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'ListFollower'
      }
    ]
  }
);

module.exports = mongoose.model("Follower", Follower);