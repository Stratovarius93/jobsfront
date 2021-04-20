part of 'chatList_bloc.dart';

@immutable
abstract class ChatListEvent {}

class AddChatToList extends ChatListEvent {
  final ItemChat itemChat;

  AddChatToList(this.itemChat);
}

class RemoveChatFromList extends ChatListEvent {
  final ItemChat itemChat;

  RemoveChatFromList(this.itemChat);
}

class AddChatToListByID extends ChatListEvent {
  final String idWorker;

  AddChatToListByID(this.idWorker);
}
