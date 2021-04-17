part of 'chatSelected_bloc.dart';

class ChatSelectedState {
  final String name;
  final String lastName;
  final String lastMessage;
  final String urlPhoto;
  final int unReadMessages;

  ChatSelectedState(
      {this.name = 'Unnamed',
      this.lastName = 'Unnamed',
      this.lastMessage = '',
      this.urlPhoto = '',
      this.unReadMessages = 0});
}
