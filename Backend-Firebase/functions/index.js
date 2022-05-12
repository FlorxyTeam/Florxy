//const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
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

app.use("/uploads", express.static("uploads"));
app.use(express.json());

const userRoute = require("./routes/user");
app.use("/user", userRoute);

const profileRoute = require("./routes/profile");
app.use("/profile", profileRoute);

const homeRoute = require("./routes/home");
app.use("/home", homeRoute);

const productRoute = require("./routes/product");
app.use("/product", productRoute);

app.route("/").get((req, res) => res.json("Hello world"));

 app.listen(Port, "0.0.0.0", () =>
    console.log(`you server is running on port ${Port}`)
   );

// const server = app;

// const io = require("socket.io")(server);

// const clients = {};


// io.on("connection",(socket)=>{
//   console.log("socket connected");
//   console.log(socket.id, "has joined");

//   socket.on("test",(username)=>{
//     console.log(username);
//     clients[username] = socket;
//     console.log(clients);
//   });

//   socket.on("message",(msg)=>{
//     console.log(msg);
//     const targetUsername = msg.targetUsername;
//     if(clients[targetUsername]) clients[targetUsername].emit("message",msg);
//   });

// });

//exports.app = functions.region("asia-southeast1").https.onRequest(app);
