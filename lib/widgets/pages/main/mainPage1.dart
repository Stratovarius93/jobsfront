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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
              child: Row(
                children: [
                  _card(context),
                  _card(context),
                  _card(context),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GenericLoginCategoryText(
              title: 'Notificaciones',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: _notificationsList(context),
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
          color: Colors.grey.withOpacity(0.5),
          size: 16,
        ),
        SizedBox(
          width: 8,
        ),
        Text(text,
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth(context) * 0.05,
                )))
      ],
    );
  }

  _card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GenericLoginCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth(context) * 0.065,
                  backgroundImage: NetworkImage(
                    'https://thumbs.dreamstime.com/b/beautiful-woman-taking-selfie-times-square-young-her-smartphone-new-york-56955944.jpg',
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Ana Mena',
                  style: GoogleFonts.getFont(fontApp,
                      textStyle: TextStyle(
                          color: colorTextTitle,
                          fontSize: screenWidth(context) * 0.058,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Ionicons.checkmark_circle,
                  color: Colors.lightGreen,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listItems(context, 'Carpinteria'),
                  _listItems(context, 'Quito nieve'),
                  _listItems(context, 'Corto el pasto'),
                ],
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
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '(2.75)',
                        style: GoogleFonts.getFont(fontApp,
                            fontSize: screenWidth(context) * 0.04,
                            color: colorTextSubTitle,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
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
                          '2km',
                          style: GoogleFonts.getFont(fontApp,
                              fontSize: screenWidth(context) * 0.04,
                              fontWeight: FontWeight.w500,
                              color: colorPrimaryButton),
                        )
                      ],
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

  _notificationsList(BuildContext context) {
    return Column(
      children: [
        _notificationsItem(context),
        _notificationsItem(context),
        _notificationsItem(context),
        _notificationsItem(context),
      ],
    );
  }

  _notificationsItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: colorPrimaryButton.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                Ionicons.chatbubble,
                color: colorPrimaryButton,
                size: screenWidth(context) * 0.08,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mensajes',
                    style: GoogleFonts.getFont(fontApp,
                        fontSize: screenWidth(context) * 0.04,
                        fontWeight: FontWeight.w700,
                        color: colorPrimaryButton)),
                Text(
                  'Trabajador x te envio un me...',
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
