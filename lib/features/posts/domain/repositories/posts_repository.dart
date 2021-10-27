import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';

abstract class PostsRepository {
  Future<Either<Failure, void>> getPosts();

  Future<Either<Failure, PostModel>> getPost(int id);
}
