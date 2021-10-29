import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/moor/posts_dao.dart';

abstract class PostsLocalDataSource {
  Future<void> cachePosts(List<PostModel> posts);
  Future<List<PostModel>?> getPosts();
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  PostsLocalDataSourceImpl(this.moorPostsDao);

  final MoorPostDao moorPostsDao;

  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    for (final PostModel post in posts) {
      await moorPostsDao.addOrUpdatePost(post);
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      return await moorPostsDao.getPost();
    } catch (e) {
      throw CacheFailure();
    }
  }
}
