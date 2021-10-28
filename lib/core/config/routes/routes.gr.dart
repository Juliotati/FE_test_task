// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:fe_test_task/features/posts/data/models/post_model.dart' as _i4;
import 'package:fe_test_task/features/posts/posts.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

class FERouter extends _i2.RootStackRouter {
  FERouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    PostsRoute.name: (routeData) {
      return _i2.AdaptivePage<_i1.Posts>(
          routeData: routeData, child: const _i1.Posts());
    },
    PostDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailsRouteArgs>();
      return _i2.AdaptivePage<_i1.PostDetails>(
          routeData: routeData,
          child: _i1.PostDetails(key: args.key, post: args.post));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(PostsRoute.name, path: '/'),
        _i2.RouteConfig(PostDetailsRoute.name, path: '/post-details')
      ];
}

/// generated route for [_i1.Posts]
class PostsRoute extends _i2.PageRouteInfo<void> {
  const PostsRoute() : super(name, path: '/');

  static const String name = 'PostsRoute';
}

/// generated route for [_i1.PostDetails]
class PostDetailsRoute extends _i2.PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({_i3.Key? key, required _i4.PostModel post})
      : super(name,
            path: '/post-details',
            args: PostDetailsRouteArgs(key: key, post: post));

  static const String name = 'PostDetailsRoute';
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({this.key, required this.post});

  final _i3.Key? key;

  final _i4.PostModel post;
}
