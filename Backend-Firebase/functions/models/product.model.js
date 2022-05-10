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
      p_cate: String,
      p_img: String,
      ing_id :[
        {
          type: mongoose.Schema.Types.ObjectId,
          ref: "Ingredient",
        }
      ],
      rating: {
         type: Number,
         default: 0
     },
     numReview: {
         type: Number,
         default: 0
     },

    },
    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Product", Product);
