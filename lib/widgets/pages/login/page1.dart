import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/loginImageSwiper.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage1 extends StatelessWidget {
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
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: 40,
                  ),
                  GenericLoginTitle(title: S.current.appName),
                  SizedBox(
                    height: 80,
                  ),

                  //Image.asset(
                  //'assets/imgScreen1.png',
                  //height: 250,
                  //width: 250,
                  //),
                  GenericLoginSwiper(),

                  //SizedBox(
                  //height: 16,
                  //),
                  //GenericLoginSubTitle(
                  //title: S.current.page1Description,
                  //textAlign: TextAlign.center),
                  SizedBox(
                    height: 16,
                  ),
                  GenericPrimaryButton(
                    title: S.current.page1Button,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'loginPage2');
                    },
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
