import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';

class LoginPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      GenericLoginTitle(title: S.current.appName),
                      SizedBox(
                        height: 80,
                      ),
                      Image.asset(
                        'assets/imgScreen1.png',
                        height: 250,
                        width: 250,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GenericLoginSubTitle(
                          title: S.current.page1Description,
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 80,
                      ),
                      GenericPrimaryButton(
                        title: S.current.page1Button,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'loginPage2');
                        },
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
