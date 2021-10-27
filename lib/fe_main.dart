import 'package:fe_test_task/core/core.dart';
import 'package:fe_test_task/features/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FETestApp extends StatelessWidget {
  const FETestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: provider(),
      child: MaterialApp(
        title: 'FE Posts',
        theme: lightThemeData,
        debugShowCheckedModeBanner: false,
        home: const Posts(),
        routes: <String, Widget Function(BuildContext)>{
          Posts.route: (BuildContext context) => const Posts(),
          PostDetails.route: (BuildContext context) => const PostDetails(),
        },
      ),
    );
  }
}
