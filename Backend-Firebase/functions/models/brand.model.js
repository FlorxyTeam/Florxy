const mongoose = require("mongoose");
const schema = mongoose.Schema;

const Brand = schema(
    {
      name: {
        type: String,
        required: true,
        unique: true,
      },
      owners :[{
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
      }],
      about: {
        type: String,
        default: "",
      },
      banner: {
        type: String,
        default: "",
      },
      recommend :[{
        type: mongoose.Schema.Types.ObjectId,
        ref: "Product",
      }],
    },
);

module.exports = mongoose.model("Brand", Brand);
