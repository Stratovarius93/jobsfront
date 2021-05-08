import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/generics/card.dart';
import 'package:AppWork/widgets/generics/largeButton.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/sliverPersistenceTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

List<CreditCard> _listCreditCard = [
  CreditCard('1324 1234 1324 1234', '12/2021', 123),
  CreditCard('1324 1234 1324 1234', '12/2022', 123),
  CreditCard('1324 1234 1324 1234', '12/2022', 123),
  CreditCard('1324 1234 1324 1234', '12/2022', 123),
  CreditCard('1324 1234 1324 1234', '12/2022', 123),
];

int value;

class WorkerPage5 extends StatefulWidget {
  @override
  _WorkerPage5State createState() => _WorkerPage5State();
}

class _WorkerPage5State extends State<WorkerPage5> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverPersistenceTitle(
                      title: 'Pago',
                      enableBackArrow: true,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GenericLoginCategoryText(
                            title: 'Select card',
                          ),
                        ),
                        RadioListBuilder(
                          onChanged: (selected) {
                            setState(() {
                              value = selected;
                            });
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        _addCard(context),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 16),
                          child: LargeButton(
                            text: 'Crear trabajo',
                            enable: (value == null) ? false : true,
                            onTap: () {},
                            color: colorPrimaryButtonText,
                            backgroundColor: colorPrimaryButton,
                            elevation: 10,
                            shadow: colorPrimaryButton.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class RadioListBuilder extends StatefulWidget {
  final Function(int) onChanged;

  const RadioListBuilder({Key key, this.onChanged}) : super(key: key);

  @override
  _RadioListBuilderState createState() => _RadioListBuilderState();
}

class _RadioListBuilderState extends State<RadioListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: _listCreditCard.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GenericLoginCard(
              child: RadioListTile(
                contentPadding: EdgeInsets.all(2),
                value: index,
                groupValue: value,
                onChanged: widget.onChanged,
                title: Text(
                  _listCreditCard[index].cardNumber,
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: Theme.of(context).textTheme.headline6.color,
                          fontSize: screenWidth(context) * 0.055)),
                ),
                subtitle: Text(
                  'Exp. ${_listCreditCard[index].expDate}',
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: Theme.of(context).textTheme.subtitle1.color,
                          fontSize: screenWidth(context) * 0.048)),
                ),
              ),
            ),
          );
        });
  }
}

class CreditCard {
  final String cardNumber;
  final String expDate;
  final int secretCode;

  CreditCard(this.cardNumber, this.expDate, this.secretCode);
}

Widget _addCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'workerPage4');
    },
    child: Container(
      height: 60,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context)
              .inputDecorationTheme
              .labelStyle
              .color
              .withOpacity(0.1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pay with another card',
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                    color:
                        Theme.of(context).inputDecorationTheme.labelStyle.color,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth(context) * 0.05)),
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Ionicons.add_circle_sharp,
            color: Theme.of(context).inputDecorationTheme.labelStyle.color,
          )
        ],
      ),
    ),
  );
}
