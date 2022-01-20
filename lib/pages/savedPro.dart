import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';

class SavedPro extends StatefulWidget {
  const SavedPro({Key? key}) : super(key: key);

  @override
  _SavedProState createState() => _SavedProState();
}

class _SavedProState extends State<SavedPro> {
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
