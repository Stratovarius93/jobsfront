import 'package:AppWork/bloc/local/chatSelectedBloc/chatSelected_bloc.dart';
import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

ScrollController _controller = ScrollController();

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatSelectedBloc, ChatSelectedState>(
        builder: (BuildContext context, state) {
      return Scaffold(
        appBar: AppBar(
          brightness: Theme.of(context).appBarTheme.brightness,
          iconTheme: IconThemeData(
              color: Theme.of(context).appBarTheme.actionsIconTheme.color),
          title: Text(
            '${state.name} ${state.lastName}',
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                    color: Theme.of(context).textTheme.headline6.color,
                    fontSize: screenWidth(context) * 0.05)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'workerPage1');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                      color: colorPrimaryButton,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    S.current.chatPage1,
                    style: GoogleFonts.getFont(fontApp,
                        textStyle: TextStyle(color: colorPrimaryButtonText)),
                  )),
            )
          ],
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        body: Stack(
          children: [
            ListView.builder(
              reverse: true,
              controller: _controller,
              itemCount: state.messagesList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 90),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                int reverseIndex = state.messagesList.length - 1 - index;
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (state.messagesList[reverseIndex].messageType ==
                            "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (state.messagesList[reverseIndex].messageType ==
                                "receiver"
                            ? Theme.of(context)
                                .textTheme
                                .subtitle1
                                .color
                                .withOpacity(0.1)
                            : Colors.blue[200]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        state.messagesList[reverseIndex].messageContent,
                        style: GoogleFonts.getFont(fontApp,
                            textStyle: TextStyle(
                                color: (state.messagesList[reverseIndex]
                                            .messageType ==
                                        "receiver"
                                    ? Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .color
                                    : Colors.black),
                                fontSize: screenWidth(context) * 0.04)),
                        //style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 3, top: 3),
                //height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    boxShadow: [
                      BoxShadow(
                          //color: Colors.grey.withOpacity(0.5),
                          color: Theme.of(context).cardTheme.shadowColor,
                          blurRadius: 12,
                          offset: Offset(0.0, 0.0))
                    ]),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Ionicons.camera,
                        color: colorPrimaryButton,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        onTap: () {
                          //Timer(
                          //Duration(milliseconds: 300),
                          //() => _controller
                          //.jumpTo(_controller.position.maxScrollExtent));
                        },
                        scrollPhysics: BouncingScrollPhysics(),
                        minLines: 1,
                        maxLines: 3,
                        keyboardType: TextInputType.text,
                        placeholder: '${S.current.chatPage0}...',
                        placeholderStyle: GoogleFonts.getFont(fontApp,
                            textStyle: TextStyle(
                                color: Color(0xffC4C6CC),
                                fontSize: screenWidth(context) * 0.045)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .color
                              .withOpacity(0.1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        //Timer(
                        //Duration(milliseconds: 300),
                        //() => _controller
                        //.jumpTo(_controller.position.maxScrollExtent));
                      },
                      icon: Icon(
                        Ionicons.send,
                        color: colorPrimaryButton,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
