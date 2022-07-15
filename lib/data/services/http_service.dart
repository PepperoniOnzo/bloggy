import 'dart:convert';

import 'package:bloggy/data/constants/configurations.dart';
import 'package:bloggy/data/models/post.dart';
import 'package:http/http.dart';

class HttpService {
  Future<List<Post>> getAllPosts() async {
    final Response response = await get(
        Uri(scheme: 'https', host: 'bloggy-api.herokuapp.com', path: '/posts'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body.map((e) => Post.fromJson(e)).toList();
      return posts;
    }
    throw Exception('Failed to load posts');
  }
}
