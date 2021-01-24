import 'package:flutter/material.dart';

import '../login/view.dart' show StateMVC, App;

class Home extends StatefulWidget {
  const Home({this.title, Key key}) : super(key: key);
  final String title;

  @override
  State createState() => _Home();
}

class _Home extends StateMVC<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Theme(
        data: App.themeData,
        child: Scaffold(
          body: Container(
              width: width,
              height: height,
              color: Theme.of(context).backgroundColor,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: height * .05),
                        width: width * .8,
                        child: Text('home')),
                  ]))),
        ));
  }
}
