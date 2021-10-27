import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/core/usecases/usecases.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';

class GetPosts implements UseCase<void, NoParams> {
  const GetPosts(this.repository);

  final PostsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.getPosts();
  }
}
