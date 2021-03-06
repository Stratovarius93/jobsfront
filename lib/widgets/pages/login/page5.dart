import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginSignUpInput.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';

class LoginPage5 extends StatelessWidget {
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
                        title: S.current.page5Title,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GenericLoginCategoryText(
                              title: '${S.current.page5Name}:')),
                      SizedBox(
                        height: 2,
                      ),
                      GenericLoginInput(
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GenericLoginCategoryText(
                              title: '${S.current.page5lastName}:')),
                      SizedBox(
                        height: 2,
                      ),
                      GenericLoginInput(
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GenericLoginCategoryText(
                              title: '${S.current.page5Pass}:')),
                      SizedBox(
                        height: 2,
                      ),
                      GenericLoginInput(
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GenericLoginCategoryText(
                              title: '${S.current.page5RepeatPass}:')),
                      SizedBox(
                        height: 2,
                      ),
                      GenericLoginInput(
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GenericPrimaryButton(
                        title: '${S.current.page5Button}',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'loginPage6');
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
              Navigator.pushReplacementNamed(context, 'loginPage4');
            },
          ),
        )
      ]),
      backgroundColor: backgroundColor,
    );
  }
}
