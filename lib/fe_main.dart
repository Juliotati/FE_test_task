import 'package:fe_test_task/core/network_info.dart';
import 'package:fe_test_task/features/posts/data/datasources/remote_datasource.dart';
import 'package:fe_test_task/features/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class FETestApp extends StatelessWidget {
  const FETestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ListenableProvider<PostsNetwork>(create: (BuildContext context) {
          return PostsNetwork();
        }),
        Provider<NetWorkInfoImpl>(create: (BuildContext context) {
          return NetWorkInfoImpl.instance;
        }),
      ],
      child: MaterialApp(
        title: 'FE Posts',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
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
