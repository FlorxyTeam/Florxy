import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class FavPost extends StatefulWidget {
  const FavPost({Key? key}) : super(key: key);

  @override
  _FavPostState createState() => _FavPostState();
}

class _FavPostState extends State<FavPost> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Poppins(
          text: "Favorite Post",
          size: 20,
          color: c.greenMain,
          fontWeight: f.medium),
    );
  }
}
