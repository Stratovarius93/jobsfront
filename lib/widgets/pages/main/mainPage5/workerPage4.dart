import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/largeButton.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/mainInputDropdown.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

List<String> _listMonth = ['1', '2', '3', '4'];

List<String> _listYear = ['2022', '2023', '2024'];

List<String> _listState = ['Estado 1', 'Estado 2', 'Estado 3'];

List<String> _listCountries = ['Country 1', 'Country 2', 'Country 3'];

String _valueMonth = _listMonth[0];
String _valueYear = _listYear[0];
String _valueState = _listState[0];
String _valueCountry = _listCountries[0];

class WorkerPage4 extends StatefulWidget {
  @override
  _WorkerPage4State createState() => _WorkerPage4State();
}

class _WorkerPage4State extends State<WorkerPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GenericLoginTitle(title: 'Pago'),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Card Number',
                        ),
                      ),
                      GenericMainInput(
                        textInputType: TextInputType.number,
                        suffixIcon: Icon(Icons.credit_card),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GenericLoginCategoryText(
                            title: 'Expiration date',
                          ),
                          GenericLoginCategoryText(
                            title: 'Security code',
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              GenericMainInputDropdown(
                                width: (screenWidth(context) - 80) * 0.33,
                                items: _listMonth,
                                dropdownValue: _valueMonth,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _valueMonth = newValue;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              GenericMainInputDropdown(
                                width: (screenWidth(context) - 80) * 0.33,
                                items: _listYear,
                                dropdownValue: _valueYear,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _valueYear = newValue;
                                  });
                                },
                              ),
                            ]),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: (screenWidth(context) - 80) * 0.33,
                              child: GenericMainInput(
                                textInputType: TextInputType.number,
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Nombre que aparece en la tarjeta',
                        ),
                      ),
                      GenericMainInput(
                        suffixIcon: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Direccion',
                        ),
                      ),
                      GenericMainInput(
                        textInputType: TextInputType.streetAddress,
                        suffixIcon: Icon(Ionicons.location),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GenericLoginCategoryText(
                            title: 'Ciudad',
                          ),
                          GenericLoginCategoryText(
                            title: 'Estado',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GenericMainInput(),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          GenericMainInputDropdown(
                            width: (screenWidth(context) * 0.5) - 24,
                            items: _listState,
                            dropdownValue: _valueState,
                            onChanged: (String newValue) {
                              setState(() {
                                _valueState = newValue;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GenericLoginCategoryText(
                            title: 'Zip code',
                          ),
                          GenericLoginCategoryText(
                            title: 'Country',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GenericMainInput(
                              textInputType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          GenericMainInputDropdown(
                            width: (screenWidth(context) * 0.5) - 24,
                            items: _listCountries,
                            dropdownValue: _valueCountry,
                            onChanged: (String newValue) {
                              setState(() {
                                _valueCountry = newValue;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 16),
                        child: LargeButton(
                          text: 'Crear trabajo',
                          onTap: () {},
                          color: colorPrimaryButtonText,
                          backgroundColor: colorPrimaryButton,
                          elevation: 10,
                          shadow: colorPrimaryButton.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            height: 80,
            width: screenWidth(context),
            color: backgroundColor,
            child: Align(
              alignment: Alignment.topLeft,
              child: BackArrow(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ]));
  }
}
