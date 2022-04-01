const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Comment = Schema(
    {
        owner: String,
        mainpost: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Post'
        },
        body: String,
        comment: {
            type: Number,
            default: "0"
        },
        favorite: {
            type: Number,
            default: "0"
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Comment", Comment);