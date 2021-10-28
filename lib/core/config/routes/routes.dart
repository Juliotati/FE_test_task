import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fe_test_task/features/posts/posts.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute<dynamic>>[
    AutoRoute<Posts>(page: Posts, initial: true),
    AutoRoute<PostDetails>(page: PostDetails)
  ],
)
class $FERouter {}
