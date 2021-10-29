import 'package:fe_test_task/features/posts/data/models/post_model.dart';
import 'package:fe_test_task/features/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostCard Widget', () {
    const PostModel post = PostModel(
      id: 1,
      userId: 345,
      title: 'title',
      body: 'body',
    );
    final ValueKey<String> postKey = ValueKey<String>('post-${post.id}');

    Widget postCard = const MaterialApp(
      home: PostCard(post: post),
    );
    testWidgets(
      'should contain PostCardDecoration as first widget in the tree',
      (WidgetTester tester) async {
        await tester.pumpWidget(postCard);

        expect(find.byType(PostCardDecoration), findsOneWidget);
      },
    );
    testWidgets(
      'should contain a key of "${post.id}"',
      (WidgetTester tester) async {
        await tester.pumpWidget(postCard);

        expect(find.byKey(postKey), findsOneWidget);
      },
    );
  });
}
