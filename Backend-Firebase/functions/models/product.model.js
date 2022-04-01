const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Product = schema(
    {
      p_name: {
        type: String,
        required: true,
      },
      p_brand: {
        type: String,
        required: true,
      },
      p_desc: String,
      p_img: String,
      ing_name: Array,
      ing_met: Array,
      ing_irr: Array,
      ing_rate: Array,
      mention: {
        type: Number,
        default: 0,
      },
      review: {
        type: Number,
        default: 0,
      },
    },
    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Product", Product);
