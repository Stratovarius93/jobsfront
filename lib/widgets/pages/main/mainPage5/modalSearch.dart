import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//List fooList = ['one', 'two', 'three', 'four', 'five'];
List filteredList = [];

List<_ItemElement> _listItems = [
  _ItemElement(
    'Jhon Lennon Plomero',
    'Ultimo mensaje',
    'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
    3,
  ),
  _ItemElement(
      'Ana Mena',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
  _ItemElement(
      'Luis Sanchez',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      2),
  _ItemElement(
      'Pedro Picapiedras',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
  _ItemElement(
      'Pablo Morsa',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      4),
  _ItemElement(
      'Maria Jose',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
  _ItemElement(
      'Daniela Rae',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
  _ItemElement(
      'Carly Jepsen',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
  _ItemElement(
      'Jackie Chan',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
  _ItemElement(
      'Carlos Perez',
      'Ultimo mensaje',
      'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
      0),
];

class ModalSearch extends StatefulWidget {
  @override
  _ModalSearchState createState() => _ModalSearchState();
}

class _ModalSearchState extends State<ModalSearch> {
  @override
  void initState() {
    super.initState();
    filteredList = _listItems;
  }

  void filter(String inputString) {
    filteredList = _listItems
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

  Future<List<_ItemElement>> search(String search) async {
    await Future.delayed(Duration(seconds: 1));
    search = search.toLowerCase();
    filter(search);
    return filteredList
        .map((item) => _ItemElement(
            item.name, item.lastMessage, item.urlPhoto, item.unReadMessages))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SearchBar<_ItemElement>(
            minimumChars: -1,
            onSearch: search,
            onItemFound: (_ItemElement item, int index) {
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

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class _ItemElement {
  final String name;
  final String lastMessage;
  final String urlPhoto;
  final int unReadMessages;

  _ItemElement(this.name, this.lastMessage, this.urlPhoto, this.unReadMessages);
}
