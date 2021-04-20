import 'dart:async';

import 'package:AppWork/data/mainPage3/workerList.dart';
import 'package:AppWork/data/mainPage5/chatList.dart';
import 'package:AppWork/models/mainPage5/itemModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatList_event.dart';
part 'chatList_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListState());

  @override
  Stream<ChatListState> mapEventToState(
    ChatListEvent event,
  ) async* {
    if (event is RemoveChatFromList) {
      yield* _removeChatFromList(event.itemChat);
    } else if (event is AddChatToList) {
      yield* _addChatListEvent(event.itemChat);
    } else if (event is AddChatToListByID) {
      yield* _addChatListEventByID(event.idWorker);
    }
  }
}

Stream<ChatListState> _removeChatFromList(ItemChat itemChat) async* {
  chatList.remove(itemChat);
  yield ChatListState(itemChatList: chatList);
}

Stream<ChatListState> _addChatListEvent(ItemChat itemChat) async* {
  chatList.add(itemChat);
  yield ChatListState(itemChatList: chatList);
}

Stream<ChatListState> _addChatListEventByID(String idWorker) async* {
  ItemChat _itemChat;
  for (var i = 0, len = workerList.length; i < len; ++i) {
    if (workerList[i].idWorker == idWorker) {
      _itemChat = ItemChat(workerList[i].idWorker, workerList[i].name,
          workerList[i].lastName, 'New Contact', workerList[i].urlPhoto, 0);
    }
  }

  bool _equals = false;
  for (var i = 0, len = chatList.length; i < len; ++i) {
    if (chatList[i].idWorker == idWorker) {
      _equals = true;
    }
  }

  if (!_equals) {
    chatList.add(_itemChat);
  }
  yield ChatListState(itemChatList: chatList);
}
