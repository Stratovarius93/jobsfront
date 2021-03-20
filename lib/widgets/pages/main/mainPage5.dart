import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: GoogleFonts.getFont(fontApp,
              textStyle: TextStyle(
                  color: colorTextTitle, fontWeight: FontWeight.w600)),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: colorTextTitle,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _Item(
            title: 'Jhon Lennon Plomero',
            subtitle: 'Ultimo mensaje',
            urlPhoto:
                'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
            unReadMessages: 3,
          ),
          _Item(
            title: 'Jhon Lennon Plomero',
            subtitle: 'Ultimo mensaje',
            urlPhoto:
                'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
          ),
          _Item(
            title: 'Jhon Lennon Plomero',
            subtitle: 'Ultimo mensaje',
            urlPhoto:
                'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
            unReadMessages: 2,
          ),
          _Item(
            title: 'Jhon Lennon Plomero',
            subtitle: 'Ultimo mensaje',
            urlPhoto:
                'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
          ),
          _Item(
            title: 'Jhon Lennon Plomero',
            subtitle: 'Ultimo mensaje',
            urlPhoto:
                'https://static.toiimg.com/photo/79610635.cms?width=500&resizemode=4&imgsize=1364307',
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlPhoto;
  final int unReadMessages;
  const _Item({
    Key key,
    @required this.title,
    this.subtitle = '',
    this.urlPhoto,
    this.unReadMessages = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListTile(
        key: UniqueKey(),
        leading: CircleAvatar(
          radius: screenWidth(context) * 0.065,
          backgroundImage: NetworkImage(
            urlPhoto,
          ),
        ),
        title: Text(title,
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                    color: colorTextTitle,
                    fontSize: screenWidth(context) * 0.05,
                    fontWeight: (unReadMessages > 0)
                        ? FontWeight.w600
                        : FontWeight.w400))),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.getFont(fontApp,
              textStyle: TextStyle(
                  color: (unReadMessages > 0) ? colorText6 : colorText2,
                  fontSize: screenWidth(context) * 0.045,
                  fontWeight: (unReadMessages > 0)
                      ? FontWeight.w500
                      : FontWeight.w300)),
        ),
        trailing: (unReadMessages > 0)
            ? CircleAvatar(
                radius: screenWidth(context) * 0.03,
                backgroundColor: colorListItems[1],
                child: Text(unReadMessages.toString()),
              )
            : null,
      ),
    );
  }
}
