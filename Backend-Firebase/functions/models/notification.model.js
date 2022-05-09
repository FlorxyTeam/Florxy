const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Notification = schema(
    {
        username: String,
        otherusername: String,
        type: String,
        body: String,
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Notification", Notification);