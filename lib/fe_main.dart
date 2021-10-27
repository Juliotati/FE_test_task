import 'package:fe_test_task/features/posts/posts.dart';
import 'package:flutter/material.dart';

class FETestApp extends StatelessWidget {
  const FETestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, Widget Function(BuildContext)>{
        Posts.route: (BuildContext context) => const Posts(),
        PostDetails.route: (BuildContext context) => const PostDetails(),
      },
      title: 'FE Posts',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Posts(),
    );
  }
}
