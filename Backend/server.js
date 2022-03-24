const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const http = require('http');
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
// app.use(cors());

const userRoute = require("./routes/user");
app.use("/user", userRoute);

const profileRoute = require("./routes/profile");
app.use("/profile", profileRoute);


const homeRoute = require("./routes/home");
app.use("/home", homeRoute);

const blogRoute = require("./routes/blogpost");
app.use("/blogPost", blogRoute);

const productRoute = require("./routes/product");
const console = require("console");
app.use("/product", productRoute);

app.route("/").get((req, res) => res.json("Hello world"));

const server = app.listen(Port,"0.0.0.0", () => 
  console.log(`you server is running on port ${Port}`)
);

// var server = http.createServer(app);
const io = require("socket.io")(server);
var clients = {};

io.on("connection",(socket)=>{
  console.log('socket connected');
  console.log(socket.id, "has joined");
  socket.on("test",(username)=>{
    console.log(username);
    clients[username] = socket;
    console.log(clients);
  });

  socket.on("message",(msg)=>{
    console.log(msg);
    let targetUsername = msg.targetUsername;
    if(clients[targetUsername]) clients[targetUsername].emit("message",msg);
  });
});