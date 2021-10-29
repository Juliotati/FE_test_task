import 'package:fe_test_task/features/posts/data/models/post_model.dart';

import 'moor_posts.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'posts_dao.g.dart';

@UseDao(tables: <Type>[MoorPosts])
class MoorPostDao extends DatabaseAccessor<AppDataBase>
    with _$MoorPostDaoMixin {
  MoorPostDao([this.db]) : super(db!);
  final AppDataBase? db;

  Future<void> addOrUpdatePost(PostModel post) async {
    final MoorPost? existingPost = await (select(moorPosts)
          ..where(($MoorPostsTable tbl) => tbl.id.equals(post.id)))
        .getSingleOrNull();
    if (existingPost == null) {
      final MoorPostsCompanion _post = MoorPostsCompanion(
        id: Value<int>(post.id),
        userId: Value<int>(post.userId),
        title: Value<String>(post.title),
        body: Value<String>(post.body),
      );
      into(moorPosts).insert(_post);
    }
    return;
  }

  Future<List<PostModel>> getPost() async {
    try {
      final List<MoorPost> _moorPosts = await select(moorPosts).get();
      return asPostModels(_moorPosts);
    } catch (_) {
      rethrow;
    }
  }

  List<PostModel> asPostModels(List<MoorPost> posts) {
    return posts.map((MoorPost post) {
      return PostModel(
        id: post.id,
        userId: post.userId,
        title: post.title,
        body: post.body,
      );
    }).toList();
  }
}
