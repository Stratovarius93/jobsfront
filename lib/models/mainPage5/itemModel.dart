class ItemChat {
  final String idWorker;
  final String name;
  final String lastName;
  final String lastMessage;
  final String urlPhoto;
  final int unReadMessages;

  ItemChat(this.idWorker, this.name, this.lastName, this.lastMessage,
      this.urlPhoto, this.unReadMessages);
  @override
  String toString() {
    return '[$idWorker]';
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
