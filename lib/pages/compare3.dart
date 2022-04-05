import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../postProvider.dart';

class ModalMentionPost3 {
  static Dialog_Settings(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.92,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(33.0),
            topRight: const Radius.circular(33.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 78,
                  child: Divider(
                    height: 0,
                    color: c.greyMain,
                    thickness: 3.5,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 15),
              Expanded(child: Product()),
            ],
          ),
        ),
      ),
    );
  }
}



class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  @override
  void fetchData() async {
    var id1 = await storage.read(key: "p_id1");
    var id2 = await storage.read(key: "p_id2");
    var id3 = await storage.read(key: "p_id3");
    await networkHandler.get("/product/compare/" + id1! + "/" + id2!+ "/" + id3!);
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PostProvider>(context, listen: false).fetchCompare3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,

      ),
    );
  }
}
