import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              GenericLoginTitle(
                title: '${S.current.page6Title}',
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: _loginGridView(context),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GenericPrimaryButton(
                  title: '${S.current.page6Button}',
                  onPressed: () {
                    print('Done');
                    Navigator.pushReplacementNamed(context, 'mainIndex');
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BackArrow(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'loginPage5');
            },
          ),
        ),
      ]),
      backgroundColor: backgroundColor,
    );
  }
}

Widget _loginGridView(BuildContext context) {
  return GridView.count(
    physics: BouncingScrollPhysics(),
    crossAxisCount: 2,
    children: List.generate(10, (index) {
      return Container(
        margin: EdgeInsets.all(8),
        child: _card(
          context,
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                'Item $index',
                style: GoogleFonts.getFont(fontApp,
                    textStyle: TextStyle(
                        color: colorTextSubTitle,
                        fontSize: screenWidth(context) * 0.045)),
              )
            ],
          ),
        ),
      );
    }),
  );
}

Widget _card(BuildContext context, Widget child) {
  return Container(
    child: child,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: colorBackgroundCard,
        boxShadow: [
          BoxShadow(
              color: colorShadowCard.withOpacity(0.2),
              blurRadius: 16,
              offset: Offset(0.0, 0.0))
        ]),
  );
}
