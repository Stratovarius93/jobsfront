import 'package:AppWork/bloc/local/chatListBloc/chatList_bloc.dart';
import 'package:AppWork/bloc/local/chatSelectedBloc/chatSelected_bloc.dart';
import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/pages/login/page1.dart';
import 'package:AppWork/widgets/pages/login/page2.dart';
import 'package:AppWork/widgets/pages/login/page3.dart';
import 'package:AppWork/widgets/pages/login/page4.dart';
import 'package:AppWork/widgets/pages/login/page5.dart';
import 'package:AppWork/widgets/pages/login/page6.dart';
import 'package:AppWork/widgets/pages/main/mainIndex.dart';
import 'package:AppWork/widgets/pages/main/mainPage3/moreAboutPage.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/chatPage.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/workerPage1.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/workerPage2.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/workerPage3.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/workerPage4.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/workerPage5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/local/workerSelectedBloc/workerSelected_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: backgroundColor2,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent
      //statusBarBrightness: Brightness.dark
      ));
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<WorkerSelectedBloc>(
        create: (_) => WorkerSelectedBloc(),
      ),
      BlocProvider<ChatSelectedBloc>(
        create: (_) => ChatSelectedBloc(),
      ),
      BlocProvider<ChatListBloc>(
        create: (_) => ChatListBloc(),
      )
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData(primaryColor: colorPrimaryButton),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Welcome to MyApp',
      initialRoute: 'mainIndex',
      routes: {
        //login
        'loginPage1': (BuildContext context) => LoginPage1(),
        'loginPage2': (BuildContext context) => LoginPage2(),
        'loginPage3': (BuildContext context) => LoginPage3(),
        'loginPage4': (BuildContext context) => LoginPage4(),
        'loginPage5': (BuildContext context) => LoginPage5(),
        'loginPage6': (BuildContext context) => LoginPage6(),
        'mainIndex': (BuildContext context) => MainIndex(),
        'moreAboutPage': (BuildContext context) => MoreAboutPage(),
        'chatPage': (BuildContext context) => ChatPage(),
        'workerPage1': (BuildContext context) => WorkerPage1(),
        'workerPage2': (BuildContext context) => WorkerPage2(),
        'workerPage3': (BuildContext context) => WorkerPage3(),
        'workerPage4': (BuildContext context) => WorkerPage4(),
        'workerPage5': (BuildContext context) => WorkerPage5(),
      },
    );
  }
}
