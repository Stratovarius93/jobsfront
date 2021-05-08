part of 'chatSelected_bloc.dart';

class ChatSelectedState {
  final String name;
  final String lastName;
  final String lastMessage;
  final String urlPhoto;
  final int unReadMessages;
  final List<ChatMessage> messagesList;
  ChatSelectedState(
      {this.name = 'Unnamed',
      this.lastName = 'Unnamed',
      this.lastMessage = '',
      this.urlPhoto = '',
      this.unReadMessages = 0,
      this.messagesList = const []});
}

//@immutable
//abstract class ChatSelectedState {}

//class ChatSelectedStateInitial extends ChatSelectedState {
//final String name;
//final String lastName;
//final String lastMessage;
//final String urlPhoto;
//final int unReadMessages;
//final List<ChatMessage> messagesList;

//ChatSelectedStateInitial(
//{this.name = 'Unnamed',
//this.lastName = 'Unnamed',
//this.lastMessage = '',
//this.urlPhoto = '',
//this.unReadMessages = 0,
//this.messagesList = const []});
//}
