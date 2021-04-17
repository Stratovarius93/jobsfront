part of 'chatSelected_bloc.dart';

@immutable
abstract class ChatSelectedEvent {}

class SelectChat extends ChatSelectedEvent {
  final String idWorker;

  SelectChat(this.idWorker);
}
