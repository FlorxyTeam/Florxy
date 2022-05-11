const mongoose = require("mongoose");

const schema = mongoose.Schema;

const RequestInfluencerAlias = schema(
    {
        username:{
        type: String,
        required: true,
        },
        influencer: {
           type: String,
           default: "",
          },
        img: {
        type: String,
        default: "",
         },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Request-influencer-Alias", RequestInfluencerAlias);