const mongoose =require("mongoose");
const Schema =mongoose.Schema;

const BlogPost = Schema({
    email: String,
    title: String,
    body: String,
    coverImage:{
    type:String,
      default: "",
    },
    favorite:Number,
    share:Number,
    comment:Number,
});

module.exports = mongoose.model("BlogPost",BlogPost);