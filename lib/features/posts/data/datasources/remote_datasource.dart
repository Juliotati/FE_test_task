import 'dart:convert';

import 'package:fe_test_task/core/network_info.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<void> getPosts();
}

enum PostState {
  loaded,
  loading,
  empty,
}

class PostsNetwork extends PostRemoteDataSource with ChangeNotifier {
  List<PostModel>? data = <PostModel>[];

  PostState state = PostState.empty;

  static const String _postsAPI = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<void> getPosts() async {
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;

    if (!isConnected) {
      _setStateAsEmpty();
      return;
    }
    _setStateAsLoading();
    try {
      final http.Response response = await http.get(Uri.parse(_postsAPI));

      if (response.statusCode != 200) {
        _setStateAsEmpty();
        return;
      }
      final List<dynamic> decodePosts = jsonDecode(response.body);

      final List<PostModel> posts = decodePosts.map((dynamic post) {
        return PostModel.fromJson(post);
      }).toList();

      data = posts;
      _setStateAsLoaded();
    } catch (_) {
      _setStateAsEmpty();
      rethrow;
    }
  }

  void _setStateAsEmpty() {
    state = PostState.empty;
    notifyListeners();
  }

  void _setStateAsLoaded() {
    state = PostState.loaded;
    notifyListeners();
  }

  void _setStateAsLoading() {
    state = PostState.loading;
    notifyListeners();
  }
}
