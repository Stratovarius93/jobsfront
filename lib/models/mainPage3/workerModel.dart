class WorkerModel {
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

  WorkerModel(
      this.name,
      this.lastName,
      this.urlPhoto,
      this.verified,
      this.rating,
      this.address,
      this.distance,
      this.minSalary,
      this.listJobs,
      this.typeJob,
      this.clients,
      this.joinedTime,
      this.jobs,
      this.studies,
      this.skills);
}

class Job {
  final String name;
  final String time;

  Job(this.name, this.time);
}

class Studies {
  final String type;
  final String name;

  Studies(this.type, this.name);
}
