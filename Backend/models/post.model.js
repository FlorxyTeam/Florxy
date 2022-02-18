const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Post = Schema(
    {
        post: String,
        brand: String,
        product: String,
        coverImage: [
            {
                type: String,
                default: ""
            }
        ],
        comment: {
            type: Number,
            default: "0"
        },
        favorite: {
            type: Number,
            default: "0"
        },
        rating: {
            type: Number,
            default: ""
        },
        type: String
    },
    {
        timestamp: true,
    }
);

module.exports = mongoose.model("Post", Post);