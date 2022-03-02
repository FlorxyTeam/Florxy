const mongoose = require("mongoose");




const Schema = mongoose.Schema;

const Productduean = Schema(
    {
        refbrand: String,
        refproduct:String,
        image: {
          type: String,
          default: "",
        },
        mention: {
            type: Number,
            default: "0"
        },
        review: {
            type: Number,
            default: "0"
        }
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Productduean", Productduean);