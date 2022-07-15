class Comment {
  late final int id;
  late final int postId;
  late final String body;

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['postId'] = postId;
    data['body'] = body;
    return data;
  }
}
