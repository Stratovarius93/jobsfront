import 'package:AppWork/bloc/local/chatSelectedBloc/chatSelected_bloc.dart';
import 'package:AppWork/bloc/local/workerSelectedBloc/workerSelected_bloc.dart';
import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/data/mainPage3/workerList.dart';
import 'package:AppWork/widgets/generics/card.dart';
import 'package:AppWork/widgets/generics/largeButton.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/modalBottomSheet.dart';
import 'package:AppWork/widgets/pages/main/mainPage3/moreAboutPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:AppWork/generated/l10n.dart';

double _cardHeight = 0.0;

class MainPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _cardHeight = screenWidth(context) * 0.58;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: GenericLoginTitle(
              title: 'Username',
              size: screenWidth(context) * 0.09,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GenericLoginCategoryText(
              title: S.current.mainPage30,
            ),
          ),
          Container(
            height: _cardHeight,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: workerList.length,
                itemBuilder: (context, index) {
                  return _card(
                      context,
                      workerList[index].idWorker,
                      workerList[index].urlPhoto,
                      workerList[index].name,
                      workerList[index].lastName,
                      workerList[index].verified,
                      workerList[index].rating,
                      workerList[index].distance,
                      workerList[index].listJobs);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GenericLoginCategoryText(
              title: S.current.mainPage31,
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0),
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 0),
                  child: _notificationsList([
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        S.current.mainPage32,
                        'Trabajador x te envio un men..'),
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        S.current.mainPage32,
                        'Trabajador x te envio un men..'),
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        S.current.mainPage32,
                        'Trabajador x te envio un men..'),
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        S.current.mainPage32,
                        'Trabajador x te envio un men..'),
                    SizedBox(
                      height: 96,
                    )
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItems(BuildContext context, String text, double fontSize) {
    return Row(
      children: [
        Icon(
          Ionicons.checkmark_circle,
          color: colorText3,
          size: 16,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(text,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.getFont(fontApp,
                  textStyle: TextStyle(
                    color: colorText2,
                    fontSize: fontSize,
                  ))),
        )
      ],
    );
  }

  _card(
      BuildContext context,
      String idWorker,
      String image,
      String title,
      String title2,
      bool verified,
      double rating,
      double distance,
      List<String> jobs) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 0),
      child: InkWell(
        onTap: () {
          showModalBottom(
              context,
              _ModalBottom(
                idWorker: idWorker,
                image: image,
                title: title,
                verified: verified,
                rating: rating,
                distance: distance,
              ));
        },
        child: GenericLoginCard(
          width: screenWidth(context) * 0.7,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: _cardHeight * 0.102,
                    backgroundImage: NetworkImage(
                      image,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  //Expanded(
                  //child: Text(
                  //'$title $title2',
                  //maxLines: 2,
                  //style: GoogleFonts.getFont(fontApp,
                  //textStyle: TextStyle(
                  //height: 1,
                  //color: colorTextTitle,
                  //fontSize: _cardHeight * 0.082,
                  //fontWeight: FontWeight.w600)),
                  //),
                  //),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$title',
                            style: GoogleFonts.getFont(fontApp,
                                textStyle: TextStyle(
                                    height: 1,
                                    color: colorTextTitle,
                                    fontSize: _cardHeight * 0.08,
                                    fontWeight: FontWeight.w600)),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '$title2 ',
                                style: GoogleFonts.getFont(fontApp,
                                    textStyle: TextStyle(
                                        height: 1,
                                        color: colorTextTitle,
                                        fontSize: _cardHeight * 0.08,
                                        fontWeight: FontWeight.w600)),
                              ),
                              WidgetSpan(
                                child: (verified)
                                    ? Icon(
                                        Ionicons.checkmark_circle,
                                        color: colorCheckmarkIcon,
                                      )
                                    : Container(),
                              )
                            ]),
                          ),
                        ]),
                  ),
                  //SizedBox(
                  //width: 4,
                  //),
                  //(verified)
                  //? Icon(
                  //Ionicons.checkmark_circle,
                  //color: colorCheckmarkIcon,
                  //)
                  //: Container(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: jobs
                      .map((e) => _listItems(context, e, _cardHeight * 0.07))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: colorIconRatings,
                          ),
                          itemCount: 5,
                          itemSize: _cardHeight * 0.08,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '($rating)',
                          style: GoogleFonts.getFont(fontApp,
                              fontSize: _cardHeight * 0.06,
                              color: colorTextSubTitle,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                            color: colorPrimaryButton.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Icon(
                              Ionicons.location,
                              color: colorPrimaryButton,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '$distance km',
                              style: GoogleFonts.getFont(fontApp,
                                  fontSize: _cardHeight * 0.06,
                                  fontWeight: FontWeight.w500,
                                  color: colorPrimaryButton),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _notificationsList(List<Widget> list) {
    return Column(
      children: list,
    );
  }

  _notificationsItem(BuildContext context, IconData iconData, Color color,
      String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: colorBackgroundNotification,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                iconData,
                color: color,
                size: screenWidth(context) * 0.08,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.getFont(fontApp,
                          fontSize: screenWidth(context) * 0.04,
                          fontWeight: FontWeight.w700,
                          color: color)),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.getFont(fontApp,
                        fontSize: screenWidth(context) * 0.045,
                        fontWeight: FontWeight.w300,
                        color: colorTextSubTitle),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ModalBottom extends StatelessWidget {
  final String idWorker;
  final String image;
  final String title;
  final bool verified;
  final double rating;
  final double distance;

  const _ModalBottom(
      {Key key,
      this.idWorker,
      this.image,
      this.title,
      this.verified,
      this.rating,
      this.distance})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerSelectedBloc, WorkerSelectedState>(
        builder: (BuildContext context, state) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: screenWidth(context) * 0.15,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                title,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBarIndicator(
                  rating: rating,
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
                  '($rating)',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  'Quito, Ecuador, $distance',
                  style: GoogleFonts.getFont(
                    fontApp,
                    fontSize: screenWidth(context) * 0.04,
                    color: colorText4,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: colorText5,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Tipo de trabajo ',
                          style: GoogleFonts.getFont(fontApp,
                              fontWeight: FontWeight.w700,
                              color: colorText5,
                              fontSize: screenWidth(context) * 0.045),
                          children: [
                            TextSpan(
                                text: ' de la persona',
                                style: GoogleFonts.getFont(fontApp,
                                    color: colorText5,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: colorText5,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '112',
                          style: GoogleFonts.getFont(fontApp,
                              fontWeight: FontWeight.w700,
                              color: colorText5,
                              fontSize: screenWidth(context) * 0.045),
                          children: [
                            TextSpan(
                                text: ' clientes',
                                style: GoogleFonts.getFont(fontApp,
                                    color: colorText5,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: colorText5,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Se unió hace ',
                          style: GoogleFonts.getFont(fontApp,
                              fontWeight: FontWeight.w400,
                              color: colorText5,
                              fontSize: screenWidth(context) * 0.045),
                          children: [
                            TextSpan(
                                text: ' 3 meses',
                                style: GoogleFonts.getFont(fontApp,
                                    color: colorText5,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            LargeButton(
              text: '${S.current.mainPage34} $title',
              onTap: () {
                BlocProvider.of<WorkerSelectedBloc>(context)
                    .add(SelectWorker(idWorker));
                Navigator.pop(context);
                //Navigator.pushNamed(context, 'moreAboutPage');
                showGeneralDialog(
                  barrierLabel: "Label",
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: Duration(milliseconds: 300),
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return MoreAboutPage();
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            LargeButton(
              text: S.current.mainPage33,
              onTap: () {
                BlocProvider.of<ChatSelectedBloc>(context)
                    .add(SelectChat(idWorker));
                Navigator.pushNamed(context, 'chatPage');
              },
              color: colorPrimaryButtonText,
              backgroundColor: colorPrimaryButton,
              elevation: 10,
              shadow: colorPrimaryButton.withOpacity(0.4),
            ),
          ],
        ),
      );
    });
  }
}
