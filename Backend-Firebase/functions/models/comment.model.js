const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Comment = schema(
    {
        username: String,
        mainpost: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Post"
        },
        body: String,
        vote: [
            {
                username: {
                    type: String,
                },
            }
        ],
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Comment", Comment);