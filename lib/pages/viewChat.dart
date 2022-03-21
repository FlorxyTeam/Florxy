import 'package:Florxy/Model/chatModel.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/messageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' ;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ViewChatPage extends StatefulWidget {
  final ChatModel chatModel;
  const ViewChatPage({Key? key, required this.chatModel}) : super(key: key);

  @override
  _ViewChatPageState createState() => _ViewChatPageState();
}

class _ViewChatPageState extends State<ViewChatPage> {
  // late IO.Socket socket;

  @override
  void initState() {
    connect();
    super.initState();
  }

  void connect() {
    // socket = IO.io('http://192.168.2.37:8080',
    //     IO.OptionBuilder()
    //         .setTransports(['websocket'])
    //         .setExtraHeaders({'Connection': 'upgrade', 'Upgrade': 'websocket'})
    //         .disableAutoConnect()
    //         .build()
    // );
    // socket.connect();
    // socket.onConnect((data) => print("socket connected"));
    // socket.onConnectError((data) => print(data));

    Socket socket = io('http://192.168.2.37:8080',
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build()
    );
    socket.connect();
    socket.onConnect((data) => print("socket connected"));

    // socket = IO.io("http://192.168.2.37:8080",<String,dynamic>{
    //   "transports": ["websocket"],
    //   "autoConnect": false,
    // });
    // socket.connect();
    // socket.emit("/test","Hello!");
    // socket.onConnect((data) => print('socket connected'));
    // // socket?.onConnectError((data) => print(data));
    // print(socket.connected);


    // socket = IO.io('http://192.168.2.37:8080');
    // socket?.onConnect((_) {
    //   print('connect');
    //   socket?.emit('msg', 'test');
    // });
    // socket?.on('event', (data) => print(data));
    // socket?.onDisconnect((_) => print('disconnect'));
    // socket?.on('fromServer', (_) => print(_));
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
                                    text: 'Putita T.',
                                    fontWeight: f.semiBold,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  Inter(text: "@" + widget.chatModel.username!, size: 12, color: c.textUsername, fontWeight: f.medium),
                                  SizedBox( height: 7 ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 7, left: 7, top: 4, bottom: 4),
                                          child: Inter(
                                              text: "Beauty Advisor",
                                              size: 8.5,
                                              color: Colors.white,
                                              fontWeight: f.semiBold),
                                        ),
                                        decoration: BoxDecoration(
                                            color: c.greenMain,
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      SizedBox( width: 5 ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, left: 5, top: 2, bottom: 2),
                                          child: Inter(
                                              text: "Brand Presenter",
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        MyMessage(),
                        ReplyMessage(),
                        MyMessage(),
                        ReplyMessage(),
                        MyMessage(),
                        ReplyMessage(),
                        MyMessage(),
                        ReplyMessage(),
                      ],
                    ),
                  ),
                ),
              )
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
                              // controller: _commentController,
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
                            onPressed: () {},
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
