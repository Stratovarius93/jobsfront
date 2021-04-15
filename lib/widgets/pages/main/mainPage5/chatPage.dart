import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

ScrollController _controller = ScrollController();

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorTextTitle),
        title: Text(
          'Jhon Lennon',
          style: GoogleFonts.getFont(fontApp,
              textStyle: TextStyle(
                  color: colorTextTitle,
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
        backgroundColor: backgroundColor2,
      ),
      body: Stack(
        children: [
          ListView.builder(
            reverse: true,
            controller: _controller,
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 90),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              int reverseIndex = messages.length - 1 - index;
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[reverseIndex].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[reverseIndex].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[reverseIndex].messageContent,
                      style: GoogleFonts.getFont(fontApp,
                          textStyle:
                              TextStyle(fontSize: screenWidth(context) * 0.04)),
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
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              //height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
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
                        color: Color(0xffF0F1F5),
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
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];
