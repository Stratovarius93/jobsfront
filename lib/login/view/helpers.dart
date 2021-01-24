import 'package:flutter/material.dart';

import '../view.dart' show StateMVC;

class CircularProgress extends StatefulWidget {
  const CircularProgress();
  @override
  State createState() => _CircularProgress();
}

class _CircularProgress extends StateMVC<CircularProgress> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(top: height * 0.5),
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              )))
        ]));
  }
}

Object backArrow(context) {
  return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      shadowColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ));
}
