const mongoose =require("mongoose");
const Schema =mongoose.Schema;

const BlogPost = Schema({
    email: String,
    username:String,
    fullname: String,
    professor: {
          type: String,
          default: "",
        },
    influencer: {
      type: String,
      default: "",
    },
    img: {
      type: String,
      default: "",
    },
    type: String,
    body: String,
    coverImage:{
    type:String,
      default: "",
    },
    favorite:{
        type:Number,
        default:0,
    },
    share:{
        type:Number,
        default:0,
    },
    comment:{
        type:Number,
        default:0,
    },
    reviewrating:{
        type:Number,
        default:0,
    },
    refproduct:{
        type:String,
        default:"",
    },
    refbrand:{
        type:String,
        default:"",
    },
    forwho:{
        type:String,
        default:"Everyone",
    }
},
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("BlogPost",BlogPost);