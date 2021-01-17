import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../view.dart' show StateMVC;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import '../controller.dart'
    show verificarAutenticador, firebaCloudMessaging_Listeners;
import '../model.dart'
    show VerificarAuthResponse, VerificarNumeroResponse, LoginPhoneNumber;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstLog extends StatefulWidget {
  const FirstLog({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _FirstLogState();
}

class _FirstLogState extends StateMVC<FirstLog> {
  TextEditingController authController = new TextEditingController();

  Future<VerificarAuthResponse> _futureVerificarAuthResponse;

  Future<VerificarNumeroResponse> _futureVerificarNumeroResponse;

  final _formKey = GlobalKey<FormState>();

  final _authCodeKey = GlobalKey<FormState>();

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
            color: HexColor('#f5f5f5'),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: height * .15),
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
                Container(
                  margin: EdgeInsets.only(
                      top: height * 0.10,
                      left: width * 0.05,
                      right: width * 0.05),
                  child: ButtonTheme(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all<Size>(Size(5000, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor("#345e78"))),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/loginPhoneNumber');
                      },
                      child: Text(AppLocalizations.of(context).login),
                    ),
                  ),
                )
              ],
            ))));
  }
}
