const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const Chat = Schema(
    {
        sender: String,
        receiver: String,
        message: {
            type: String
        },
          time: {
            type: String
        }
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Chat", Chat);