import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMessage extends StatefulWidget {
  String? message,time;
  MyMessage({Key? key, this.message, this.time}) : super(key: key);

  @override
  _MyMessageState createState() => _MyMessageState();
}

class _MyMessageState extends State<MyMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: c.greenSub1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14.0),
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0)
              )
            ),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 125
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 15),
              child: Inter(
                text: widget.message!,
                size: 13,
                color: Colors.white,
                fontWeight: f.medium,
              ),
            ),
          ),
          SizedBox(height: 5),
          Inter(text: widget.time!, size: 11, color: c.textUsername, fontWeight: f.semiBold)
        ],
      ),
    );
  }
}

//###################Reply-message###############################

class ReplyMessage extends StatefulWidget {
  String? message, time;
  ReplyMessage({Key? key, this.message, this.time}) : super(key: key);

  @override
  _ReplyMessageState createState() => _ReplyMessageState();
}

class _ReplyMessageState extends State<ReplyMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: c.message,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(14.0),
                    topLeft: Radius.circular(14.0),
                    topRight: Radius.circular(14.0)
                )
            ),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 125
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 15),
              child: Inter(
                text: widget.message!,
                size: 13,
                color: Colors.black,
                fontWeight: f.medium,
              ),
            ),
          ),
          SizedBox(height: 5),
          Inter(text: widget.time!, size: 11, color: c.textUsername, fontWeight: f.semiBold)
        ],
      ),
    );
  }
}


