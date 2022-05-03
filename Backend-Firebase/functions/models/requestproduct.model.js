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
      ing_name: {
        type: String,
        default: ''
      },
      p_img: String,
      ing_name: {
         type: String,
         default: ''
      },
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
       rating: {
          type: String,
          default: '0'
       },

    },

    {
      timestamps: true,
    }
);

module.exports = mongoose.model("Requestproduct", Requestproduct);