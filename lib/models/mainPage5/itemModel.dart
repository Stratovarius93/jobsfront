class ItemElement {
  final String name;
  final String lastMessage;
  final String urlPhoto;
  final int unReadMessages;

  ItemElement(this.name, this.lastMessage, this.urlPhoto, this.unReadMessages);
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
