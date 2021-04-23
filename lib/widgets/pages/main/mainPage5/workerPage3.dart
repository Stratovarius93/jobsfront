import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/shadows.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/mainInput.dart';
import 'package:AppWork/widgets/generics/mainInputDropdown.dart';
import 'package:AppWork/widgets/generics/sliverPersistenceTitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

List<String> _list = [
  'Cada semana',
  'Cada 15 días',
  'Cada mes',
];

String _dropdownValue = _list[0];

bool _showWidget = false;

class WorkerPage3 extends StatefulWidget {
  @override
  _WorkerPage3State createState() => _WorkerPage3State();
}

class _WorkerPage3State extends State<WorkerPage3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: backgroundColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorPrimaryButton,
            onPressed: () {
              Navigator.pushNamed(context, 'workerPage5');
            },
            child: Icon(Ionicons.arrow_forward_outline),
          ),
          body: SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverPersistenceTitle(
                      title: 'Contratar',
                      enableBackArrow: true,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                color: (!_showWidget)
                                    ? colorPrimaryButton
                                    : colorSecondButton,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _showWidget = false;
                                  });
                                },
                                child: Text(
                                  'Por Hora',
                                  style: GoogleFonts.getFont(fontApp,
                                      textStyle: TextStyle(
                                          color: (!_showWidget)
                                              ? colorPrimaryButtonText
                                              : colorPrimaryButton,
                                          fontSize:
                                              screenWidth(context) * 0.042)),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: (!_showWidget)
                                    ? colorSecondButton
                                    : colorPrimaryButton,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    //_showWidget = !_showWidget;
                                    _showWidget = true;
                                  });
                                },
                                child: Text(
                                  'Por contrato',
                                  style: GoogleFonts.getFont(fontApp,
                                      textStyle: TextStyle(
                                          color: (!_showWidget)
                                              ? colorSecondButtonText
                                              : colorPrimaryButtonText,
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
                        (_showWidget == true)
                            ? Column(
                                children: [
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
                              )
                            : Container()
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
