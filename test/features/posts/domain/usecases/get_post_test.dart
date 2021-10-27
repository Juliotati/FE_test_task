import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/core/usecases/usecases.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';
import 'package:fe_test_task/features/posts/domain/usecases/get_post.dart';
import 'package:fe_test_task/features/posts/domain/usecases/get_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

Future<void> main() async {
  final MockPostsRepository mockPostsRepository = MockPostsRepository();
  final GetPost useCase = GetPost(mockPostsRepository);

  const PostModel tPost = PostModel(
    id: 1,
    userId: 3212,
    title: 'Programmers and Chefs',
    body: 'The is not dirty because is was badly designed, it is dirty because someone did not do the dishes after lunch and dinner.',
  );
  test(
    'verify if getPost is actually called from the repository with the given id',
    () async {
      when(() => mockPostsRepository.getPost(tPost.id))
          .thenAnswer((_) async => const Right<Failure, PostModel>(tPost));

      final Either<Failure, void> result = await useCase(Params(tPost.id));

      expect(result.isRight(), true);
      verify(() => mockPostsRepository.getPost(tPost.id));
      verifyNoMoreInteractions(mockPostsRepository);
    },
  );
}
