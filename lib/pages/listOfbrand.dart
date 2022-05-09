import 'package:Florxy/Model/allbrand.dart';
import 'package:Florxy/NetworkHandler.dart';
import 'package:Florxy/widgets/fontWeight.dart';
import 'package:Florxy/widgets/font.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:Florxy/pages/brandoverview.dart';

class listofbrand extends StatefulWidget {
  const listofbrand({Key? key}) : super(key: key);

  @override
  State<listofbrand> createState() => _listofbrandState();
}

class _listofbrandState extends State<listofbrand> {
  final networkHandler = NetworkHandler();
  List<AllBrands> _allbrand = <AllBrands>[];
  List<AllBrands> _allbrandDisplay = <AllBrands>[];
  TextEditingController _searchText = TextEditingController();
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    networkHandler.fetchAllbrand().then((value) {
      setState(() {
        _allbrand.addAll(value);
        _allbrandDisplay = _allbrand;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: c.shadow.withOpacity(0.32),
                spreadRadius: -17,
                blurRadius: 30,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26),
            )),
            title: Padding(
              padding: const EdgeInsets.only(top: 18.5, left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      color: c.blackMain,
                      iconSize: 25,
                      onPressed: () => Navigator.of(context).pop()),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Poppins(
                        text: "All Brands",
                        size: 22,
                        color: c.blackMain,
                        fontWeight: f.semiBold),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _searchBar(),
              _searchText!.text.isNotEmpty && _allbrandDisplay.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 60),
                          Icon(FeatherIcons.frown, size: 70, color: c.greySub),
                          SizedBox(height: 8),
                          Inter(
                              text: "Sorry, we couldn't find any brand.",
                              size: 13,
                              color: c.greySub,
                              fontWeight: f.semiBold),
                          SizedBox(height: 2),
                          Inter(
                              text: "Please find another brand.",
                              size: 13,
                              color: c.greySub,
                              fontWeight: f.semiBold)
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _allbrandDisplay.length,
                      itemBuilder: (context, int index) {
                        if (_allbrandDisplay.length > 0) {
                          return _listItem(index);
                        } else {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(height: 60),
                                Icon(FeatherIcons.frown,
                                    size: 70, color: c.greySub),
                                SizedBox(height: 8),
                                Inter(
                                    text:
                                        "Sorry, we couldn't find any product.",
                                    size: 13,
                                    color: c.greySub,
                                    fontWeight: f.semiBold),
                                SizedBox(height: 2),
                                Inter(
                                    text: "Please find another product.",
                                    size: 13,
                                    color: c.greySub,
                                    fontWeight: f.semiBold)
                              ],
                            ),
                          );
                        }
                      }),
            ],
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 25, left: 25),
      child: TextField(
        controller: _searchText,
        focusNode: _focusNodes[0],
        decoration: InputDecoration(
          filled: true,
          fillColor: c.greyLight,
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
          hintText: 'Search Brand',
          hintStyle:
              TextStyle(fontSize: 16, color: c.greyMain, fontWeight: f.medium),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 13, left: 20),
            child: Icon(Icons.search_rounded,
                size: 25,
                color: _focusNodes[0].hasFocus ? c.greenMain : c.greyMain),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: c.graySub2.withOpacity(0), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: c.greenMain, width: 2),
          ),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _allbrandDisplay = _allbrand.where((brand) {
              var p_brand = brand.sId?.toLowerCase();
              return p_brand!.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Brandoverview(p_brand: _allbrandDisplay[index].sId)));
      },
      child: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 25, left: 28, right: 28),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Poppins(
                  text: _allbrandDisplay[index].sId.toString(),
                  fontWeight: f.semiBold,
                  color: c.blackMain,
                  size: 17,
                ),
                Poppins(
                  text: _allbrandDisplay[index].count.toString() + " products",
                  fontWeight: f.semiBold,
                  color: Color(0xFF848484),
                  size: 13,
                )
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Icon(Icons.arrow_forward_ios_outlined,
                  size: 18, color: c.blackMain),
            )
          ],
        ),
      )),
    );
  }
}
