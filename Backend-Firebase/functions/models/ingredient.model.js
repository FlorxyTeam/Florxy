const mongoose = require("mongoose");
const schema = mongoose.Schema;

const Ingredient = schema(
    {
      name: {
        type: String,
        required: true,
        unique: true,
      },
      rate: {
        type: String,
      },
      calling: {
        type: String,
      },
      func: [{
        type: String,
      }],
      irr: {
        type: String,
      },
      come: {
        type: String,
      },
      cosing: {
        type: String,
      },
      quick: [{
        type: String,
      }],
      detail: {
        type: String,
      },
      proof: [{
        type: String,
      }],
      link: {
        type: String,
      },
    },
);

module.exports = mongoose.model("Ingredient", Ingredient);
