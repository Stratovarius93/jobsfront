import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginPhoneinput.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GenericLoginTitle(
                        title: S.current.page3Title,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Ionicons.person_outline,
                        color: colorTextTitle,
                        size: screenWidth(context) * 0.2,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GenericLoginSubTitle(title: S.current.page3SubTile),
                      SizedBox(
                        height: 32,
                      ),
                      GenericInputPhone(),
                      SizedBox(
                        height: 32,
                      ),
                      GenericPrimaryButton(
                        title: S.current.page3Button,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'loginPage4');
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
              Navigator.pushReplacementNamed(context, 'loginPage2');
            },
          ),
        ),
      ]),
      backgroundColor: backgroundColor,
    );
  }
}
