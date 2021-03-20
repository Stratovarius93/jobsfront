import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/generics/backClose.dart';
import 'package:AppWork/widgets/generics/largeButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

int _sliding = 0;
//PageController controller = PageController(initialPage: _sliding);
PageController controller = PageController();

class MoreAboutPage extends StatefulWidget {
  @override
  _MoreAboutPageState createState() => _MoreAboutPageState();
}

class _MoreAboutPageState extends State<MoreAboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.down,
      //onDismissed: (_) => Navigator.of(context).pop(),
      onDismissed: (_) {
        Navigator.pop(context);
      },
      key: UniqueKey(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: screenWidth(context) * 0.1,
                        backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/b/beautiful-woman-taking-selfie-times-square-young-her-smartphone-new-york-56955944.jpg',
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              'Ana Mena',
                              style: GoogleFonts.getFont(fontApp,
                                  textStyle: TextStyle(
                                      color: colorTextTitle,
                                      fontSize: screenWidth(context) * 0.058,
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Ionicons.checkmark_circle,
                              color: colorCheckmarkIcon,
                              size: 24,
                            )
                          ]),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: 2.7,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: colorIconRatings,
                                ),
                                itemCount: 5,
                                itemSize: 25,
                                direction: Axis.horizontal,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '(2.7)',
                                style: GoogleFonts.getFont(fontApp,
                                    fontSize: screenWidth(context) * 0.04,
                                    color: colorTextSubTitle,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Ionicons.location,
                            color: colorText4,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Quito, Ecuador, 2km',
                            style: GoogleFonts.getFont(
                              fontApp,
                              fontSize: screenWidth(context) * 0.04,
                              color: colorText4,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Ionicons.logo_usd,
                            color: colorText2,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Salario minimo',
                            style: GoogleFonts.getFont(
                              fontApp,
                              fontSize: screenWidth(context) * 0.045,
                              color: colorText2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                CupertinoSlidingSegmentedControl(
                    children: {
                      0: Text('Empleos'),
                      1: Text('Estudios'),
                      2: Text('Competencias'),
                    },
                    groupValue: _sliding,
                    onValueChanged: (newValue) {
                      setState(() {
                        _sliding = newValue;
                        //controller.animateToPage(_sliding,
                        //duration: Duration(milliseconds: 500),
                        //curve: Curves.easeOut);

                        controller = PageController(initialPage: _sliding);
                      });
                    }),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        _sliding = value;
                        controller = PageController(initialPage: _sliding);
                        //controller.animateToPage(_sliding,
                        //duration: Duration(milliseconds: 500),
                        //curve: Curves.easeOut);
                      });
                    },
                    children: [
                      ListView(
                        padding: EdgeInsets.only(top: 0),
                        physics: BouncingScrollPhysics(),
                        children: [
                          _item1(Icons.tv, 'Peluquera', '5 años'),
                          _item1(Icons.tv,
                              'Reparacion de eletrodomesticos Oster', '5 años'),
                          _item1(Icons.tv, 'Peluquera', '5 años'),
                          _item1(Icons.tv, 'Peluquera', '5 años'),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.only(top: 0),
                        physics: BouncingScrollPhysics(),
                        children: [
                          _item2(Icons.school, 'Colegio', 'Colegio Pepito'),
                          _item2(Icons.school, 'Universidad',
                              'Universidad de las Americas'),
                        ],
                      ),
                      ListView(
                        padding: EdgeInsets.only(top: 0),
                        physics: BouncingScrollPhysics(),
                        children: [
                          _item3(colorListItems[0], 'Organizado'),
                          _item3(colorListItems[1], 'Puntual'),
                          _item3(colorListItems[2], 'Creativo'),
                          _item3(colorListItems[3], 'Respetuoso'),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  child: LargeButton(
                    text: 'Contactar',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: colorPrimaryButtonText,
                    backgroundColor: colorPrimaryButton,
                    elevation: 10,
                    shadow: colorPrimaryButton.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: BackClose(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _item1(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: colorListItems[0].withOpacity(0.1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            child: Icon(
              icon,
              color: colorListItems[0],
              size: screenWidth(context) * 0.1,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: colorListItems[0],
                          fontSize: screenWidth(context) * 0.042,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(fontApp,
                      color: colorText1,
                      fontSize: screenWidth(context) * 0.04,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _item2(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: colorListItems[0].withOpacity(0.1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: screenWidth(context) * 0.1,
              color: colorListItems[0],
            )),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.getFont(fontApp,
                    textStyle: TextStyle(
                        fontSize: screenWidth(context) * 0.045,
                        fontWeight: FontWeight.w500)),
              ),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: GoogleFonts.getFont(fontApp,
                    textStyle: TextStyle(
                        fontSize: screenWidth(context) * 0.045,
                        fontWeight: FontWeight.w300)),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _item3(
    Color color,
    String title,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Ionicons.happy_outline,
              size: screenWidth(context) * 0.1,
              color: color,
            )),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.getFont(fontApp,
                  textStyle: TextStyle(
                      fontSize: screenWidth(context) * 0.045,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        )
      ]),
    );
  }
}
