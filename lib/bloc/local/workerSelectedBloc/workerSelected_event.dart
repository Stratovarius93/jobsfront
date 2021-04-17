part of 'workerSelected_bloc.dart';

@immutable
abstract class WorkerSelectedEvent {}

class SelectWorker extends WorkerSelectedEvent {
  final String idWorker;

  SelectWorker(this.idWorker);
}
