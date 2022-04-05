const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Product = schema(
    {
      productview: [
        {
          username: {
            type: String,
          },
          date: {
            type: Date,
          },
        },
      ],
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
    },
    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Product", Product);
