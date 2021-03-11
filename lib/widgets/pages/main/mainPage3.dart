import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/widgets/generics/card.dart';
import 'package:AppWork/widgets/generics/loginCategoryText.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: GenericLoginTitle(
              title: 'Username',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GenericLoginCategoryText(
              title: 'Trabajos disponibles',
            ),
          ),
          SingleChildScrollView(
              //shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    _card(
                        context,
                        'https://thumbs.dreamstime.com/b/beautiful-woman-taking-selfie-times-square-young-her-smartphone-new-york-56955944.jpg',
                        'Ana Mena',
                        true,
                        2.75,
                        2,
                        ['Carpinteria', 'Quito nieve', 'Corto el pasto']),
                    _card(
                        context,
                        'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
                        'John Lennon',
                        false,
                        4,
                        2,
                        ['Carpinteria', 'Quito nieve', 'Corto el pasto']),
                    _card(
                        context,
                        'https://img.srgcdn.com/e//VzBIRmxCTTJHc2tOUndTa0xnbEsucG5n.jpg',
                        'Alex Daddario',
                        true,
                        2.75,
                        2,
                        ['Carpinteria', 'Quito nieve', 'Corto el pasto']),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GenericLoginCategoryText(
              title: 'Notificaciones',
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
                      EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 0),
                  child: _notificationsList([
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        'Mensajes',
                        'Trabajador x te envio un men..'),
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        'Mensajes',
                        'Trabajador x te envio un men..'),
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        'Mensajes',
                        'Trabajador x te envio un men..'),
                    _notificationsItem(
                        context,
                        Ionicons.chatbubble,
                        colorPrimaryButton,
                        'Mensajes',
                        'Trabajador x te envio un men..'),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listItems(BuildContext context, String text) {
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
        Text(text,
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                  color: colorText2,
                  fontSize: screenWidth(context) * 0.05,
                )))
      ],
    );
  }

  _card(BuildContext context, String image, String title, bool verified,
      double rating, double distance, List<String> jobs) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 0),
      child: GenericLoginCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth(context) * 0.065,
                  backgroundImage: NetworkImage(
                    image,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: colorTextTitle,
                          fontSize: screenWidth(context) * 0.058,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  width: 4,
                ),
                (verified)
                    ? Icon(
                        Ionicons.checkmark_circle,
                        color: Colors.lightGreen,
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: jobs.map((e) => _listItems(context, e)).toList(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                                fontSize: screenWidth(context) * 0.04,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.getFont(fontApp,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.w700,
                        color: color)),
                Text(
                  description,
                  style: GoogleFonts.getFont(fontApp,
                      fontSize: screenWidth(context) * 0.045,
                      fontWeight: FontWeight.w300,
                      color: colorTextSubTitle),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
