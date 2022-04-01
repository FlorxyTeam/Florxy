const mongoose = require("mongoose");

const schema = mongoose.Schema;

const Chat = schema(
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