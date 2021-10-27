import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const PostModel tPostModel = PostModel(
    id: 2,
    userId: 3212,
    title: 'Programmers and Chefs',
    body:
        'The is not dirty because is was badly designed, it is dirty because someone did not do the dishes after lunch and dinner.',
  );

  test(
    'PostModel should be a subclass of Post entity',
    () async {
      expect(tPostModel, isA<Post>());
    },
  );

  const List<dynamic> dummyJson = <dynamic>[
    <String, dynamic>{
      'id': 2,
      'userId': 3212,
      'title': 'Programmers and Chefs',
      'body':
          'The is not dirty because is was badly designed, it is dirty because someone did not do the dishes after lunch and dinner.',
    },
  ];
  group('fromJson', () {
    test(
      'first post in list should match the given [tPostModel]',
      () async {
        final PostModel result = PostModel.fromJson(
          dummyJson.first as Map<String, dynamic>,
        );
        expect(result, equals(tPostModel));
      },
    );
  });
}
