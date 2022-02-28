const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Follower = Schema(
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
    listfollower: [
      {
       email: {
          type: String,
           unique: true,
        },
      username: {
        type: String,
        unique: true,
      },
  }
      ],
  }
);

module.exports = mongoose.model("Follower", Follower);