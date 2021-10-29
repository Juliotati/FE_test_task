import 'package:dartz/dartz.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/core/usecases/usecases.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/domain/repositories/posts_repository.dart';
import 'package:fe_test_task/features/posts/domain/usecases/get_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

Future<void> main() async {
  final MockPostsRepository mockPostsRepository = MockPostsRepository();
  final GetPosts useCase = GetPosts(mockPostsRepository);

  const List<PostModel> tList = <PostModel>[
    PostModel(id: 1, userId: 324, title: 'This is first', body: 'I am body 1'),
    PostModel(id: 3, userId: 334, title: 'This is first', body: 'I am body 2'),
  ];

  test(
    'verify if getPosts is actually called from the repository',
    () async {
      when(() => mockPostsRepository.getPosts()).thenAnswer((_) async {
        return const Right<Failure, List<PostModel>>(tList);
      });

      final Either<Failure, void> result = await useCase(const NoParams());

      expect(result.isRight(), true);
      verify(() => mockPostsRepository.getPosts());
      verifyNoMoreInteractions(mockPostsRepository);
    },
  );
}
