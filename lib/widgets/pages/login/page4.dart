import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginPinInput.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: Scaffold(
        body: Stack(children: [
          Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        GenericLoginTitle(
                          title: S.current.page4Title,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Icon(
                          Ionicons.mail_outline,
                          color: Theme.of(context).textTheme.headline6.color,
                          size: screenWidth(context) * 0.2,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GenericLoginSubTitle(title: S.current.page4Subtitle),
                        SizedBox(
                          height: 32,
                        ),
                        GenericPinInput(),
                        //GenericInputPhone(),
                        SizedBox(
                          height: 32,
                        ),
                        GenericPrimaryButton(
                          title: S.current.page4Button,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'loginPage5');
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BackArrow(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'loginPage3');
              },
            ),
          )
        ]),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
