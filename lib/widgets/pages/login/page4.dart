import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginPinInput.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        title: 'Enter code',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Ionicons.mail_outline,
                        color: colorTextTitle,
                        size: screenWidth(context) * 0.2,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GenericLoginSubTitle(title: 'Enter your received code: '),
                      SizedBox(
                        height: 32,
                      ),
                      GenericPinInput(),
                      //GenericInputPhone(),
                      SizedBox(
                        height: 32,
                      ),
                      GenericPrimaryButton(
                        title: 'Verificar',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'loginPage5');
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
      backgroundColor: backgroundColor,
    );
  }
}
