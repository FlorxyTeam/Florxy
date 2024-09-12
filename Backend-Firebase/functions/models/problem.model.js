const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Problem = schema(
    {
        username: String,
        body: String,
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Problem", Problem);