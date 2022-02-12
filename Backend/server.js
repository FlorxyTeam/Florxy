const express = require("express");
const mongoose = require("mongoose");
const Port = process.env.PORT || 8080;
const app = express();

const mongoURI =
  "mongodb+srv://Florxy:r95_KBygY7gcVe4@florxy.thphu.mongodb.net/Florxy?retryWrites=true&w=majority";
mongoose.connect(mongoURI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const connection = mongoose.connection;

connection.once("open", () => {
  console.log("MongoDB Connected");
});

app.use("/uploads",express.static("uploads"))
app.use(express.json());

const userRoute = require("./routes/user");
app.use("/user", userRoute);

const profileRoute = require("./routes/profile");
app.use("/profile", profileRoute);

const homeRoute = require("./routes/home");
app.use("/home", homeRoute);

app.route("/").get((req, res) => res.json("Hello world"));

app.listen(Port,"0.0.0.0", () => 
  console.log(`you server is running on port ${Port}`)
);
