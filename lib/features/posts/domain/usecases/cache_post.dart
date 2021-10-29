import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/core/usecases/usecases.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';

class CachePost implements UseCase<void,PostParam> {
  const CachePost(this.repository);

  final PostsRepository repository;

  @override
  Future<Either<Failure, void>> call(PostParam param) async {
    return repository.cachePost(param.post);
  }
}
