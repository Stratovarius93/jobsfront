import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: backgroundColor2,
          largeTitle: Text(
            'Chat',
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(color: colorTextTitle)),
          ),
        ),
        SliverAppBar(
          backgroundColor: backgroundColor2,
          flexibleSpace: FlexibleSpaceBar(
            //titlePadding: EdgeInsets.only(left: 0),
            titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Container(
              margin: EdgeInsets.only(left: 0),
              padding: EdgeInsets.only(left: 0),
              height: 36,
              width: double.infinity,
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                placeholder: 'Buscar',
                placeholderStyle: GoogleFonts.getFont(fontApp,
                    textStyle: TextStyle(
                        color: Color(0xffC4C6CC),
                        fontSize: screenWidth(context) * 0.045)),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                  child: Icon(
                    Icons.search,
                    color: Color(0xffC4C6CC),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xffF0F1F5),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
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
            SizedBox(
              height: 60,
            )
          ]),
        )
      ],
    ));
  }
}

class _Item extends StatefulWidget {
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
  __ItemState createState() => __ItemState();
}

class __ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: screenWidth(context) * 0.08,
            ),
          ),
        ),
      ),
      key: UniqueKey(),
      onDismissed: (direction) {
        //setState(() {
        //items.removeAt(index);
        //});

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Element dismissed")));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'chatPage');
          },
          key: UniqueKey(),
          leading: CircleAvatar(
            radius: screenWidth(context) * 0.065,
            backgroundImage: NetworkImage(
              widget.urlPhoto,
            ),
          ),
          title: Text(widget.title,
              style: GoogleFonts.getFont(fontApp,
                  textStyle: TextStyle(
                      color: colorTextTitle,
                      fontSize: screenWidth(context) * 0.05,
                      fontWeight: (widget.unReadMessages > 0)
                          ? FontWeight.w600
                          : FontWeight.w400))),
          subtitle: Text(
            widget.subtitle,
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                    color:
                        (widget.unReadMessages > 0) ? colorText6 : colorText2,
                    fontSize: screenWidth(context) * 0.045,
                    fontWeight: (widget.unReadMessages > 0)
                        ? FontWeight.w500
                        : FontWeight.w300)),
          ),
          trailing: (widget.unReadMessages > 0)
              ? CircleAvatar(
                  radius: screenWidth(context) * 0.03,
                  backgroundColor: colorPrimaryButton,
                  child: Text(
                    widget.unReadMessages.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
