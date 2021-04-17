part of 'workerSelected_bloc.dart';

class WorkerSelectedState {
  final String idWorker;
  final String name;
  final String lastName;
  final String urlPhoto;
  final bool verified;
  final double rating;
  final String address;
  final double distance;
  final double minSalary;
  final List<String> listJobs;
  final String typeJob;
  final int clients;
  final String joinedTime;
  final List<Job> jobs;
  final List<Studies> studies;
  final List<String> skills;

  WorkerSelectedState(
      {this.idWorker = '',
      this.name = '',
      this.lastName = '',
      this.urlPhoto = '',
      this.verified = false,
      this.rating = 0.0,
      this.address = '',
      this.distance = 0.0,
      this.minSalary = 0.0,
      this.listJobs = const [],
      this.typeJob = '',
      this.clients = 0,
      this.joinedTime = '',
      this.jobs = const [],
      this.studies = const [],
      this.skills = const []});
}
