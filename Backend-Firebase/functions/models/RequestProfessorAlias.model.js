const mongoose = require("mongoose");

const schema = mongoose.Schema;

const RequestProfessorAlias = schema(
    {
        username:{
        type: String,
        required: true,
        },
        professor: {
           type: String,
          default: "",
        },
        img: {
        type: String,
        default: "",
         },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model("Request-professor-Alias", RequestProfessorAlias);