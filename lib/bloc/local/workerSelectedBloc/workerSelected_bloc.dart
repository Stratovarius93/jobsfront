import 'dart:async';

import 'package:AppWork/data/mainPage3/workerList.dart';
import 'package:AppWork/models/mainPage3/workerModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workerSelected_event.dart';
part 'workerSelected_state.dart';

class WorkerSelectedBloc
    extends Bloc<WorkerSelectedEvent, WorkerSelectedState> {
  WorkerSelectedBloc() : super(WorkerSelectedState());

  @override
  Stream<WorkerSelectedState> mapEventToState(
    WorkerSelectedEvent event,
  ) async* {
    if (event is SelectWorker) {
      yield* _selectedWorker(event.idWorker);
    }
  }
}

Stream<WorkerSelectedState> _selectedWorker(String idWorker) async* {
  List<WorkerModel> _list = workerList;

  WorkerModel _workerSelected;
  for (var i = 0, len = _list.length; i < len; ++i) {
    if (_list[i].idWorker == idWorker) {
      _workerSelected = _list[i];
    }
  }
  yield WorkerSelectedState(
      idWorker: _workerSelected.idWorker,
      name: _workerSelected.name,
      lastName: _workerSelected.lastName,
      urlPhoto: _workerSelected.urlPhoto,
      verified: _workerSelected.verified,
      rating: _workerSelected.rating,
      address: _workerSelected.address,
      distance: _workerSelected.distance,
      minSalary: _workerSelected.minSalary,
      listJobs: _workerSelected.listJobs,
      typeJob: _workerSelected.typeJob,
      clients: _workerSelected.clients,
      joinedTime: _workerSelected.joinedTime,
      jobs: _workerSelected.jobs,
      studies: _workerSelected.studies,
      skills: _workerSelected.skills);
}
