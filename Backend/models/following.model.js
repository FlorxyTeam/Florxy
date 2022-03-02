const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Following = Schema(
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
    listfollowing: [
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

module.exports = mongoose.model("Following", Following);