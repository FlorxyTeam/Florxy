import 'package:Florxy/widgets/PostWidget.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../NetworkHandler.dart';
import '../postProvider.dart';

class FavPost extends StatefulWidget {
  String? idFavPost;
  FavPost({Key? key, this.idFavPost}) : super(key: key);

  @override
  _FavPostState createState() => _FavPostState();
}

class _FavPostState extends State<FavPost> {
  final networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();

  void fetchData() async{
    print(widget.idFavPost);
    await storage.write(key: "idFavPost", value: widget.idFavPost);
    await networkHandler.get("/profile/getFavPost/"+widget.idFavPost!);
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    Provider.of<PostProvider>(context,listen: false).fetchFavPost();
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   print(model.favPost![index]['favorite']['fullname']);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height-200,
        child: Consumer<PostProvider>(builder: (context,model,_) => FutureBuilder(
          future: model.fetchFavPost(),
          builder: (context,snapshot) => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.favPost?.length??0,
            itemBuilder: (context,int index){
              return model.favPost![index]['favorite']['type']=='mention'?MentionPost(
                name: model.favPost![index]['favorite']['fullname'],
                username: model.favPost![index]['favorite']['username'],
                postTime: model.favPost![index]['favorite']['updatedAt'].toString().substring(0, 10),
                brand: model.favPost![index]['favorite']['refbrand'],
                product: model.favPost![index]['favorite']['refproduct'],
                post: model.favPost![index]['favorite']['body'],
                comment: model.favPost![index]['favorite']['comment'],
                favorite: model.favPost![index]['favorite']['favorite'],
                urlImage: model.favPost![index]['favorite']['coverImage'],
                professor:model.favPost![index]['favorite']['professor'],
                influencer: model.favPost![index]['favorite']['influencer'],
                id: model.favPost![index]['favorite']['_id'],
              ):
              model.favPost![index]['favorite']['type']=='review'?ReviewPost(
                name: model.favPost![index]['favorite'][0],
                username: model.favPost![index]['favorite']['username'],
                postTime: model.favPost![index]['favorite']['updatedAt'].toString().substring(0, 10),
                brand: model.favPost![index]['favorite']['refbrand'],
                product: model.favPost![index]['favorite']['refproduct'],
                post: model.favPost![index]['favorite']['body'],
                rating: model.favPost![index]['favorite']['rating'],
                comment: model.favPost![index]['favorite']['comment'],
                favorite: model.favPost![index]['favorite']['favorite'],
                professor:model.favPost![index]['favorite']['professor'],
                influencer: model.favPost![index]['favorite']['influencer'],
                id: model.favPost![index]['favorite']['_id'],
              ):Container();
            },
          ),
        )),
      ),
    );
  }
}
