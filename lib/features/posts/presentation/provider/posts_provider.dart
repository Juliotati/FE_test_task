part of posts;

enum PostState {
  empty,
  loading,
  loaded,
}

class PostsProvider with ChangeNotifier {
  PostsProvider({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final PostsRemoteDataSourceImpl remoteDataSource;
  final PostsLocalDataSourceImpl localDataSource;
  final NetWorkInfoImpl networkInfo;

  PostState state = PostState.empty;
  bool hasError = false;
  List<PostModel>? data = <PostModel>[];

  Future<void> getPosts(BuildContext context) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      _setStateAsLoading();
      try {
        final List<PostModel> remotePosts =
            (await remoteDataSource.getPosts())!;
        await localDataSource.cachePosts(remotePosts);
        data = remotePosts;
        _setStateAsLoaded();
      } on ServerException {
        hasError = true;
        _setStateAsEmpty();
        throw ServerFailure();
      }
    } else {
      try {
        final List<PostModel> localPosts = await localDataSource.getPosts();
        if (localPosts.isEmpty) {
          context.read<NetWorkInfoImpl>().noConnectionWarning(context);
          data = localPosts;
          _setStateAsLoaded();
          return;
        }

        data = localPosts;
        context.read<NetWorkInfoImpl>().loadingFromCache(context);
        _setStateAsLoaded();
      } on CacheException {
        hasError = true;
        _setStateAsEmpty();
        throw CacheFailure();
      }
    }
  }

  void _setStateAsEmpty() {
    state = PostState.empty;
    notifyListeners();
  }

  void _setStateAsLoaded() {
    state = PostState.loaded;
    notifyListeners();
  }

  void _setStateAsLoading() {
    state = PostState.loading;
    notifyListeners();
  }
}
