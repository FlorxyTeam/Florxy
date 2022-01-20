import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class PostReply extends StatefulWidget {
  const PostReply({Key? key}) : super(key: key);

  @override
  _PostReplyState createState() => _PostReplyState();
}

class _PostReplyState extends State<PostReply> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Poppins(
          text: "Post&Reply",
          size: 20,
          color: c.greenMain,
          fontWeight: f.medium),
    );
  }
}
