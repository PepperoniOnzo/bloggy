import 'dart:convert';

import 'package:bloggy/data/constants/configurations.dart';
import 'package:bloggy/data/models/post.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> postPost(Post post) async {
    final http.Response response = await http.post(
        Uri(
            scheme: AppConfig.apiScheme,
            host: AppConfig.apiHost,
            path: '/posts'),
        body: {
          'title': post.title,
          'body': post.body,
        });
    return response;
  }

  Future<http.Response> updatePost(int id, Post post) async {
    final http.Response response = await http.put(
        Uri(
            scheme: AppConfig.apiScheme,
            host: AppConfig.apiHost,
            path: '/posts/$id'),
        body: {
          'title': post.title,
          'body': post.body,
        });

    return response;
  }

  Future<http.Response> deletePost(int id) async {
    final http.Response response = await http.delete(Uri(
        scheme: AppConfig.apiScheme,
        host: AppConfig.apiHost,
        path: '/posts/$id'));
    return response;
  }

  Future<http.StreamedResponse> postComment(int id, String comment) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri(
          scheme: AppConfig.apiScheme,
          host: AppConfig.apiHost,
          path: '/comments'),
    );
    request.body = json.encode({
      'postId': id,
      'body': comment,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<Post> getPostById(int id) async {
    final http.Response response = await http.get(Uri(
        scheme: AppConfig.apiScheme,
        host: AppConfig.apiHost,
        path: '/posts/$id',
        queryParameters: {'_embed': 'comments'}));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load post');
  }

  Future<List<Post>> getAllPosts() async {
    final http.Response response = await http.get(Uri(
        scheme: AppConfig.apiScheme, host: AppConfig.apiHost, path: '/posts'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body.map((e) => Post.fromJson(e)).toList();
      return posts;
    }
    throw Exception('Failed to load posts');
  }
}
