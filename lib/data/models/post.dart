import 'package:bloggy/data/models/coment.dart';

class Post {
  Post(
    this.title,
    this.body,
  );

  int id = 0;
  String title = '';
  String body = '';
  List<Comment>? comments;

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    if (json['comments'] != null) {
      comments =
          json['comments'].map<Comment>((e) => Comment.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    if (comments != null) {
      data['comments'] = comments!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
