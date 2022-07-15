import 'package:bloggy/data/services/http_service.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/post.dart';

class ViewHome extends ChangeNotifier {
  HttpService _httpService = HttpService();
  List<Post> _posts = [];
  String errorMessage = "";

  getLenghtPost() => _posts.length;
  getPosts() => _posts;

  getPostByIndex(int index) => _posts[index];

  Future<void> getHttpAllPosts() async {
    try {
      _posts = await _httpService.getAllPosts();
      errorMessage = "";
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
