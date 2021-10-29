import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/core/usecases/usecases.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';

class GetPosts implements UseCase<List<PostModel>, NoParams> {
  const GetPosts(this.repository);

  final PostsRepository repository;

  @override
  Future<Either<Failure, List<PostModel>>> call(NoParams params) async {
    return repository.getPosts();
  }
}
