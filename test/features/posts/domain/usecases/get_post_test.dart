import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/core/usecases/usecases.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';
import 'package:fe_test_task/features/posts/domain/usecases/cache_post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

Future<void> main() async {
  final MockPostsRepository mockPostsRepository = MockPostsRepository();
  final CachePost useCase = CachePost(mockPostsRepository);

  const PostModel tPost = PostModel(
    id: 1,
    userId: 3212,
    title: 'Programmers and Chefs',
    body:
        'The is not dirty because is was badly designed, it is dirty because someone did not do the dishes after lunch and dinner.',
  );
  test(
    'verify if getPost is actually called from the repository with the given id',
    () async {
      when(() => mockPostsRepository.cachePost(tPost))
          .thenAnswer((_) async => const Right<Failure, void>(null));

      final Either<Failure, void> result =
          await useCase(const PostParam(tPost));

      expect(result.isRight(), true);
      verify(() => mockPostsRepository.cachePost(tPost));
      verifyNoMoreInteractions(mockPostsRepository);
    },
  );
}
