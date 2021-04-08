import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/shadows.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/mainInputDropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

List<String> _list = [
  'Cada semana',
  'Cada 15 días',
  'Cada mes',
];

String _dropdownValue = _list[0];

class WorkerPage3 extends StatefulWidget {
  @override
  _WorkerPage3State createState() => _WorkerPage3State();
}

class _WorkerPage3State extends State<WorkerPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorPrimaryButton,
          onPressed: () {
            Navigator.pushNamed(context, 'workerPage4');
          },
          child: Icon(Ionicons.arrow_forward_outline),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GenericLoginTitle(title: 'Contratar'),
                      SizedBox(
                        height: 16,
                      ),
                      Image.network(
                          'https://album.mediaset.es/eimg/10000/2021/01/14/clipping_VNB9Tj_e4de.jpg?w=480'),
                      SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Pago aproximado',
                        ),
                      ),
                      GenericMainInput(
                        textInputType: TextInputType.number,
                        suffixIcon: Icon(Icons.attach_money),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: colorPrimaryButton,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  shadowPrimaryButton(colorPrimaryButton)
                                ]),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Por Hora',
                                style: GoogleFonts.getFont(fontApp,
                                    textStyle: TextStyle(
                                        color: colorPrimaryButtonText,
                                        fontSize:
                                            screenWidth(context) * 0.042)),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: colorSecondButton,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Por contrato',
                                style: GoogleFonts.getFont(fontApp,
                                    textStyle: TextStyle(
                                        color: colorSecondButtonText,
                                        fontSize:
                                            screenWidth(context) * 0.042)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GenericLoginCategoryText(
                          title: 'Frecuencia de pago',
                        ),
                      ),
                      GenericMainInputDropdown(
                        items: _list,
                        dropdownValue: _dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            _dropdownValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BackArrow(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ]));
  }
}
