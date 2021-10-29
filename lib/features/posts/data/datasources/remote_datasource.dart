import 'dart:convert';

import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>?> getPosts();
}

class PostsRemoteDataSourceImpl extends PostRemoteDataSource
    with ChangeNotifier {
  List<PostModel>? data = <PostModel>[];

  static const String _postsAPI = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<PostModel>?> getPosts() async {
    try {
      final http.Response response = await http.get(Uri.parse(_postsAPI));

      if (response.statusCode != 200) {
        return null;
      }
      final List<dynamic> decodePosts = jsonDecode(response.body);

      final List<PostModel> posts = decodePosts.map((dynamic post) {
        return PostModel.fromJson(post);
      }).toList();

      return posts;
    } catch (_) {
      rethrow;
    }
  }
}
