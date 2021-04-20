import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/data/mainPage5/chatList.dart';
import 'package:AppWork/models/mainPage5/itemModel.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//List fooList = ['one', 'two', 'three', 'four', 'five'];
List filteredList = [];

class ModalSearch extends StatefulWidget {
  @override
  _ModalSearchState createState() => _ModalSearchState();
}

class _ModalSearchState extends State<ModalSearch> {
  @override
  void initState() {
    super.initState();
    filteredList = chatList;
  }

  void filter(String inputString) {
    filteredList = chatList
        .where((i) => i.name.toLowerCase().contains(inputString))
        .toList();
    print(filteredList);
    setState(() {});
  }

  //Future<List<Post>> search(String search) async {
  //search = search.toLowerCase();
  //filter(search);
  //await Future.delayed(Duration(seconds: 1));
  //return List.generate(search.length, (int index) {
  //return Post(
  //"Title : $search $index",
  //"Description :$search $index",
  //);
  //});
  //}

  Future<List<ItemChat>> search(String search) async {
    await Future.delayed(Duration(seconds: 1));
    search = search.toLowerCase();
    filter(search);
    return filteredList
        .map((item) => ItemChat(item.idWorker, item.name, item.lastName,
            item.lastMessage, item.urlPhoto, item.unReadMessages))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SearchBar<ItemChat>(
            minimumChars: -1,
            onSearch: search,
            onItemFound: (ItemChat item, int index) {
              return ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'chatPage');
                },
                leading: CircleAvatar(
                  radius: screenWidth(context) * 0.065,
                  backgroundImage: NetworkImage(
                    item.urlPhoto,
                  ),
                ),
                title: Text(
                  item.name,
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: colorText5, fontWeight: FontWeight.w500)),
                ),
                subtitle: Text(
                  item.lastMessage,
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: colorText1,
                          fontSize: screenWidth(context) * 0.04)),
                ),
                trailing: (item.unReadMessages > 0)
                    ? CircleAvatar(
                        radius: screenWidth(context) * 0.03,
                        backgroundColor: colorPrimaryButton,
                        child: Text(
                          item.unReadMessages.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : null,
              );
            },
            onBack: () {
              Navigator.pop(context);
            },
            headerPadding: EdgeInsets.all(0),
            searchBarPadding: EdgeInsets.symmetric(horizontal: 0),
            searchBarStyle: SearchBarStyle(
                borderRadius: BorderRadius.circular(16),
                padding: EdgeInsets.symmetric(vertical: 0)),
            textStyle: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(fontSize: screenWidth(context) * 0.045)),
            hintStyle: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(fontSize: screenWidth(context) * 0.045)),
          ),
        ),
      ),
    );
  }
}
