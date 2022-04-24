const mongoose = require("mongoose");
const schema = mongoose.Schema;

const Requestproduct = schema(
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
      ing_name: String,
      ing_met: {
        type: String,
        default: ''
       },
      ing_irr: {
        type: String,
        default: ''
      },
      ing_rate: {
         type: String,
         default: ''
      },

    },
    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Requestproduct", Requestproduct);