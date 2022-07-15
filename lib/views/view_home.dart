import 'package:bloggy/data/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../data/models/post.dart';

class ViewHome extends ChangeNotifier {
  final HttpService _httpService = HttpService();

  List<Post> _posts = [];
  Post _selectedPost = Post('', '');
  int currentId = 0;

  String errorMessage = "";
  String errorPost = "";

  int getLenghtPost() => _posts.length;
  List<Post> getPosts() => _posts;

  Post getSelectedPost() => _selectedPost;

  Post getPostByIndex(int index) => _posts[index];

  Future<bool> updatePost(String title, String body) async {
    final Post post = Post(
      title,
      body,
    );

    final http.Response response =
        await _httpService.updatePost(_posts[currentId].id, post);
    if (response.statusCode == 200) {
      _posts.add(post);
      return true;
    } else {
      errorPost = response.body;
      return false;
    }
  }

  Future<bool> deletePost() async {
    http.Response responce =
        await _httpService.deletePost(_posts[currentId].id);
    if (responce.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendPost(String title, String body) async {
    final Post post = Post(
      title,
      body,
    );

    final http.Response response = await _httpService.postPost(post);
    if (response.statusCode == 201) {
      _posts.add(post);
      return true;
    } else {
      errorPost = response.body;
      return false;
    }
  }

  Future<bool> sendComment(String comment) async {
    http.StreamedResponse responce =
        await _httpService.postComment(_posts[currentId].id, comment);
    if (responce.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getHttpAllPosts() async {
    try {
      _posts = await _httpService.getAllPosts();
      errorMessage = "";
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> getHttpPostWithComments(int id) async {
    try {
      _selectedPost = await _httpService.getPostById(_posts[id].id);
      currentId = id;
      errorPost = "";
    } catch (e) {
      currentId = 0;
      errorPost = e.toString();
    }
  }
}
