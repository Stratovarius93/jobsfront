import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view.dart' show StateMVC;
import '../controller.dart' show firebaCloudMessaging_Listeners;
import '../../theme/mainTheme.dart' show loginButton;

class FirstLog extends StatefulWidget {
  const FirstLog({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _FirstLogState();
}

class _FirstLogState extends StateMVC<FirstLog> {
  TextEditingController authController = new TextEditingController();

  final images = [
    'assets/images/5.svg',
    'assets/images/6.svg',
    'assets/images/7.svg',
    'assets/images/8.svg',
  ];

  @override
  void initState() {
    super.initState();
    firebaCloudMessaging_Listeners();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            height: height,
            width: width,
            color: HexColor('#f2f2f2'),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * .15),
                  child: Text(
                    "Minch?",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Container(
                  width: width * 0.8,
                  height: height * 0.5,
                  child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(35),
                          child: SvgPicture.asset(
                            images[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                      itemCount: images.length,
                      scale: 0.8,
                      autoplay: true,
                      autoplayDelay: 10000,
                      duration: 500),
                ),
              ],
            ))),
        bottomNavigationBar: Container(
          color: HexColor('#f2f2f2'),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: height * 0.05, left: width * 0.05, right: width * 0.05),
            child: ElevatedButton(
              style: loginButton(),
              onPressed: () {
                Navigator.of(context).pushNamed('/loginPhoneNumber');
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).login,
                        textAlign: TextAlign.center),
                  ]),
            ),
          ),
        ));
  }
}
