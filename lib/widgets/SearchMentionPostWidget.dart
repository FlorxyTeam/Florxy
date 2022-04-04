import 'package:Florxy/widgets/font.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SearchMentionPost extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  SearchMentionPost({Key? key, required this.text, required this.onChanged, required this.hintText}) : super(key: key);

  @override
  _SearchMentionPostState createState() => _SearchMentionPostState();
}

class _SearchMentionPostState extends State<SearchMentionPost> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: Theme.of(context).platform == TargetPlatform.android
          ? 240
          : 0,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: c.searchbar,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 2, left: 8),
              child: Icon(Icons.search_rounded, size: 20, color: c.blackSub2),
            ),
            suffixIcon: widget.text.isNotEmpty ? GestureDetector(
                  child: Icon(FeatherIcons.x, size: 20, color: Colors.black),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ) : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontSize: 14.5,
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
        onChanged: widget.onChanged,
      ),
    );
  }
}
