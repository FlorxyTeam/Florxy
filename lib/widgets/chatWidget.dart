import 'package:Florxy/Model/chatModel.dart';
import 'package:Florxy/pages/viewChat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'font.dart';
import 'fontWeight.dart';

class Chat extends StatefulWidget {
  final ChatModel chatModel;
  const Chat({Key? key, required this.chatModel}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewChatPage(
            chatModel: widget.chatModel )));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange,
                // backgroundImage:
                // NetworkHandler().getImage(profileModel.email),
              ),
              title: Row(
                children: [
                  Poppins(
                    text: 'Putita T.',
                    fontWeight: f.semiBold,
                    size: 14,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Inter(text: '@'+widget.chatModel.username!, size: 12, color: c.textUsername, fontWeight: f.medium),
                ],
              ),
              subtitle: Inter(text: widget.chatModel.currentMessage!, size: 13, color: c.graySub2, fontWeight: f.medium),
              trailing: Inter(text: widget.chatModel.time!, size: 12, color: c.graySub2, fontWeight: f.medium),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Divider(
                color: c.greyMain,
                thickness: 0.7,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
