import 'dart:async';

import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/pages/main/mainPage1.dart';
import 'package:AppWork/widgets/pages/main/mainPage2.dart';
import 'package:AppWork/widgets/pages/main/mainPage3.dart';
import 'package:AppWork/widgets/pages/main/mainPage4.dart';
import 'package:AppWork/widgets/pages/main/mainPage5.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainIndex extends StatefulWidget {
  @override
  _MainIndexState createState() => _MainIndexState();
}

class _MainIndexState extends State<MainIndex> {
  double _iconSize = 24;
  final tabs = [
    MainPage1(),
    MainPage2(),
    MainPage3(),
    MainPage4(),
    MainPage5(),
  ];
  List<ElementItemIcon> _elementItemIconList = [
    ElementItemIcon(Ionicons.person, Ionicons.person_outline),
    ElementItemIcon(Ionicons.search, Ionicons.search_outline),
    ElementItemIcon(Ionicons.home, Ionicons.home_outline),
    ElementItemIcon(Ionicons.briefcase, Ionicons.briefcase_outline),
    ElementItemIcon(
        Ionicons.chatbubble_ellipses, Ionicons.chatbubble_ellipses_outline),
  ];
  List<bool> _selected = [false, false, true, false, false];
  GlobalKey _bottomNavigationKey = GlobalKey();
  final _currentIndex = StreamController<int>.broadcast();
  @override
  void dispose() {
    _currentIndex.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _iconSize = screenWidth(context) * 0.08;
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 50.0,
          items: _elementItemIconList.map((val) {
            var subIndex = _elementItemIconList.indexOf(val);
            var iconColor = _selected[subIndex] ? true : false;
            var iconData =
                _selected[subIndex] ? val.iconData : val.iconDataOutline;
            return Icon(
              iconData,
              size: _iconSize,
              color: (iconColor)
                  ? Colors.white
                  : colorPrimaryButton.withOpacity(0.4),
            );
          }).toList(),
          //color bottom navigator bar
          color: Colors.white,
          buttonBackgroundColor: colorPrimaryButton,
          backgroundColor: backgroundColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            _currentIndex.sink.add(index);
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < _selected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  _selected[buttonIndex] = true;
                } else {
                  _selected[buttonIndex] = false;
                }
              }
            });
          },
        ),
        backgroundColor: backgroundColor,
        body: StreamBuilder(
          stream: _currentIndex.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              return tabs[snapshot.data];
            } else {
              return tabs[2];
            }
          },
        ));
  }
}

class ElementItemIcon {
  IconData iconData;
  IconData iconDataOutline;
  ElementItemIcon(this.iconData, this.iconDataOutline);
}
