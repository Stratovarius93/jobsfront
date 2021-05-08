import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          child: Center(
            child: Text('MainPage1'),
          ),
        ),
      ),
    );
  }
}
