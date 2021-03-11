import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/widgets/generics/card.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(physics: BouncingScrollPhysics(), children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GenericLoginTitle(title: S.current.page2Title),
                      SizedBox(
                        height: 16,
                      ),
                      GenericLoginSubTitle(title: S.current.page2SubTitle),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'loginPage3');
                                },
                                child: GenericLoginCard(
                                  child: Icon(
                                    Ionicons.person_outline,
                                    size: screenWidth(context) * 0.15,
                                    color: colorTextTitle,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                S.current.page2User,
                                style: GoogleFonts.getFont(fontApp,
                                    textStyle: TextStyle(
                                        color: colorText1,
                                        fontSize:
                                            screenWidth(context) * 0.045)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              GenericLoginCard(
                                  child: Icon(
                                Ionicons.briefcase_outline,
                                size: screenWidth(context) * 0.15,
                                color: colorTextTitle,
                              )),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                S.current.page2Worker,
                                style: GoogleFonts.getFont(fontApp,
                                    textStyle: TextStyle(
                                        color: colorText1,
                                        fontSize:
                                            screenWidth(context) * 0.045)),
                              )
                            ],
                          )
                        ],
                      )
                    ]))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BackArrow(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'loginPage1');
            },
          ),
        ),
      ]),
      backgroundColor: backgroundColor,
    );
  }
}
