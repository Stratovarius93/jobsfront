import 'package:AppWork/bloc/local/chatSelectedBloc/chatSelected_bloc.dart';
import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/data/mainPage5/chatList.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/pages/main/mainPage5/modalSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              title: GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    barrierLabel: "Label",
                    barrierDismissible: false,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return ModalSearch();
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
                child: Container(
                  margin: EdgeInsets.only(left: 0),
                  padding: EdgeInsets.only(left: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffF0F1F5),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffC4C6CC),
                          ),
                        ),
                        Text(
                          S.current.mainPage50,
                          style: GoogleFonts.getFont(fontApp,
                              textStyle: TextStyle(
                                  color: Color(0xffC4C6CC),
                                  fontSize: screenWidth(context) * 0.045)),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: chatList.map((item) {
                var index = chatList.indexOf(item);
                return _Item(
                  title: item.name,
                  subtitle: item.lastMessage,
                  urlPhoto: item.urlPhoto,
                  unReadMessages: item.unReadMessages,
                  index: index,
                );
              }).toList(),
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
  final int index;
  const _Item({
    Key key,
    @required this.title,
    this.subtitle = '',
    this.urlPhoto,
    this.unReadMessages = 0,
    this.index,
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
        setState(() {
          chatList.removeAt(widget.index);
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Chat deleted")));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          onTap: () {
            BlocProvider.of<ChatSelectedBloc>(context)
                .add(SelectChat(chatList[widget.index].idWorker));
            Navigator.pushNamed(context, 'chatPage');
          },
          //key: UniqueKey(),
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
