const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Report = schema(
    {
        username: String,
        mainpost: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Post"
        },
        body: String,
        type: String,
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Report", Report);