import 'dart:async';

import 'package:AppWork/data/mainPage3/workerList.dart';
import 'package:AppWork/data/mainPage5/chatList.dart';
import 'package:AppWork/models/mainPage3/workerModel.dart';
import 'package:AppWork/models/mainPage5/itemModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chatSelected_event.dart';
part 'chatSelected_state.dart';

class ChatSelectedBloc extends Bloc<ChatSelectedEvent, ChatSelectedState> {
  ChatSelectedBloc() : super(ChatSelectedState());

  @override
  Stream<ChatSelectedState> mapEventToState(
    ChatSelectedEvent event,
  ) async* {
    if (event is SelectChat) {
      yield* _selectChat(event.idWorker);
    }
  }
}

Stream<ChatSelectedState> _selectChat(String idWorker) async* {
  bool _foundChat = false;
  List<WorkerModel> _list = workerList;
  ItemChat _itemElement;

  for (var i = 0, len = _list.length; i < len; ++i) {
    if (_list[i].idWorker == idWorker) {
      _itemElement = ItemChat(idWorker, _list[i].name, _list[i].lastName,
          'New Contact', _list[i].urlPhoto, 1, []);
      _foundChat = true;
    }
  }
  if (!_foundChat) {
    for (var i = 0, len = chatList.length; i < len; ++i) {
      if (chatList[i].idWorker == idWorker) {
        _itemElement = ItemChat(
            chatList[i].idWorker,
            chatList[i].name,
            chatList[i].lastName,
            chatList[i].lastMessage,
            chatList[i].urlPhoto,
            chatList[i].unReadMessages,
            chatList[i].messagesList);
      }
    }
  }
  yield ChatSelectedState(
      name: _itemElement.name,
      lastName: _itemElement.lastName,
      lastMessage: _itemElement.lastMessage,
      urlPhoto: _itemElement.urlPhoto,
      unReadMessages: _itemElement.unReadMessages,
      messagesList: _itemElement.messagesList);
}
