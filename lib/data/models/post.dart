import 'package:bloggy/data/models/coment.dart';

class Post {
  Post(this.title, this.body, this.id, this.comments);

  final int id;
  String title;
  String body;
  List<Comment> comments;
}
