import 'package:Florxy/Model/messageModel.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/messageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' ;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../NetworkHandler.dart';
import '../postProvider.dart';

class ViewChatPage extends StatefulWidget {
  String? fullname, username, influencer, professor, currentMessage, myUsername;
  ViewChatPage({Key? key, this.fullname, this.username, this.professor, this.influencer, this.currentMessage, this.myUsername}) : super(key: key);

  @override
  _ViewChatPageState createState() => _ViewChatPageState();
}

class _ViewChatPageState extends State<ViewChatPage> {
  late Socket socket;
  final networkHandler = NetworkHandler();
  TextEditingController _messageController = TextEditingController();
  List<MessageModel> messages = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context,listen: false).fetchChat(widget.myUsername!, widget.username!);
    connect();
  }

  void connect() {
    print(widget.myUsername);
    String baseurl = networkHandler.baseurl;
    socket = io( baseurl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build()
    );
    socket.connect();
    socket.emit("test", widget.myUsername);
    socket.onConnect((data) {
      print("socket connected");
      socket.on("message",(msg){
        print(msg);
        setMessage("destination", msg["message"], msg["myUsername"], msg["targetUsername"]);
      });
    });
  }

  void sendMessage(String message, String myUsername, String targetUsername) {
    socket.emit("message",
        {"message": message, "myUsername": myUsername, "targetUsername": targetUsername});
    setMessage("source", message, myUsername, targetUsername);
  }

  void setMessage(String type, String message, String sender, String receiver) async {
    MessageModel messageModel = MessageModel(type: type, message: message, time: DateTime.now().toString().substring(0,16));
    // await networkHandler.post("/profile/chatWith/"+widget.myUsername!+"/"+widget.username!, data);
    setState(() {
      messages.add(messageModel);
    });
  }

  void fetchMessage() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: Theme.of(context).platform==TargetPlatform.android?11:0),
              Container(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 22, right: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(FeatherIcons.chevronLeft),
                          iconSize: 34,
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 11),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.orange,
                                // backgroundImage:
                                // NetworkHandler().getImage(profileModel.email),
                              ),
                              SizedBox( width: 8 ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Poppins(
                                    text: widget.fullname!,
                                    fontWeight: f.semiBold,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  Inter(text: "@" + widget.username!, size: 12, color: c.textUsername, fontWeight: f.medium),
                                  SizedBox( height: 7 ),
                                  Row(
                                    children: [
                                      (widget.professor=="")?
                                      Container():Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 7, left: 7, top: 4, bottom: 4),
                                          child: Inter(
                                              text: widget.professor!,
                                              size: 8.5,
                                              color: Colors.white,
                                              fontWeight: f.semiBold),
                                        ),
                                        decoration: BoxDecoration(
                                            color: c.greenMain,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox( width: 5 ),
                                      (widget.influencer=="")?
                                      Container():Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, left: 5, top: 2, bottom: 2),
                                          child: Inter(
                                              text: widget.influencer!,
                                              size: 8.5,
                                              color: c.blueMain,
                                              fontWeight: f.bold),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: c.blueMain,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(FeatherIcons.alertCircle),
                          iconSize: 25,
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(26),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: c.shadow.withOpacity(0.32),
                        spreadRadius: 0,
                        blurRadius: 29,
                        offset: Offset(-1, -16), // changes position of shadow
                      ),
                    ],
                    color: Colors.white
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Column(
                      children: [
                        Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
                          future: model.fetchChat(widget.myUsername!, widget.username!),
                          builder: (context,snapshot) => MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: ListView.builder(
                              itemCount: model.chat?.length??0,
                              shrinkWrap: true,
                              itemBuilder: (context,int index){
                                return model.chat![index]['sender']==widget.myUsername?MyMessage(
                                  message: model.chat![index]['message'],
                                  time: model.chat![index]['time']
                                ):ReplyMessage(
                                  message: model.chat![index]['message'],
                                  time: model.chat![index]['time']
                                );
                              },
                            ),
                          ),
                        )),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController,
                            itemCount: messages.length+1,
                            itemBuilder: (context,index) {
                              if(index == messages.length) {
                                return Container(
                                  height: 70,
                                );
                              }
                              if(messages[index].type=="source") {
                                return MyMessage(
                                  message: messages[index].message,
                                  time: messages[index].time,
                                );
                              } else {
                                return ReplyMessage(
                                  message: messages[index].message,
                                  time: messages[index].time,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 70)
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(FeatherIcons.image, size: 25)
                        ),
                        SizedBox(width: 15),
                        Icon(FeatherIcons.camera, size:25, color: Colors.black),
                        SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            height: 35,
                            child: TextFormField(
                              controller: _messageController,
                              onTap: () {
                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: c.searchbar,
                                contentPadding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                hintText: 'Message...',
                                hintStyle: TextStyle(
                                    fontSize: 13.5,
                                    color: c.greyMain,
                                    fontWeight: f.medium),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(
                                      color: c.graySub2.withOpacity(0), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(
                                      color: c.graySub2.withOpacity(0), width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () async {
                              sendMessage(_messageController.text, widget.myUsername!, widget.username!);
                              // _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                              Map<String, String> data = {
                                "sender": widget.myUsername!,
                                "receiver": widget.username!,
                                "message": _messageController.text,
                                "time": DateTime.now().toString().substring(0,16)
                              };
                              // await networkHandler.post("/profile/chatWith/"+widget.myUsername!+"/"+widget.username!, data);
                              await networkHandler.post("/profile/chat", data);
                              _messageController.clear();
                            },
                            icon: Icon(FeatherIcons.send, size: 25)
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
