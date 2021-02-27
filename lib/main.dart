import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/pages/login/page1.dart';
import 'package:AppWork/widgets/pages/login/page2.dart';
import 'package:AppWork/widgets/pages/login/page3.dart';
import 'package:AppWork/widgets/pages/login/page4.dart';
import 'package:AppWork/widgets/pages/login/page5.dart';
import 'package:AppWork/widgets/pages/login/page6.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Welcome to MyApp',
      initialRoute: 'loginPage1',
      routes: {
        //login
        'loginPage1': (BuildContext context) => LoginPage1(),
        'loginPage2': (BuildContext context) => LoginPage2(),
        'loginPage3': (BuildContext context) => LoginPage3(),
        'loginPage4': (BuildContext context) => LoginPage4(),
        'loginPage5': (BuildContext context) => LoginPage5(),
        'loginPage6': (BuildContext context) => LoginPage6(),
      },
    );
  }
}
