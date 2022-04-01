const mongoose = require("mongoose");

const schema = mongoose.Schema;

const User = schema({
  email: {
    type: String,
    unique: true,
  },
  password: {
    type: String,
  },
  facebook: {
    type: String,
    unique: true,
    default: "",
  },
  google: {
    type: String,
    unique: true,
    default: "",
  },
  username: {
    type: String,
    required: true,
    unique: true,
  },
});

module.exports = mongoose.model("User", User);
