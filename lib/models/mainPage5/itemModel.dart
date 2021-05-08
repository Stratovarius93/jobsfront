import 'package:flutter/widgets.dart';

class ItemChat {
  final String idWorker;
  final String name;
  final String lastName;
  final String lastMessage;
  final String urlPhoto;
  final int unReadMessages;
  final List<ChatMessage> messagesList;

  ItemChat(this.idWorker, this.name, this.lastName, this.lastMessage,
      this.urlPhoto, this.unReadMessages, this.messagesList);
  @override
  String toString() {
    return '[$idWorker]';
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}
