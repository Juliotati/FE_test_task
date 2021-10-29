part of core;

List<SingleChildWidget> provider() {
  return <SingleChildWidget>[
    Provider<AppDataBase>(
      create: (BuildContext context) {
        return AppDataBase();
      },
    ),
    ProxyProvider<AppDataBase, PostsLocalDataSourceImpl>(
      update: (BuildContext context, AppDataBase moorDB, _) {
        return PostsLocalDataSourceImpl(moorDB.moorPostDao);
      },
    ),
    ListenableProvider<PostsRemoteDataSourceImpl>(
      create: (BuildContext context) {
        return PostsRemoteDataSourceImpl();
      },
    ),
    Provider<NetWorkInfoImpl>(
      create: (BuildContext context) {
        return NetWorkInfoImpl.instance;
      },
    ),
    ListenableProxyProvider3<PostsRemoteDataSourceImpl,
        PostsLocalDataSourceImpl, NetWorkInfoImpl, PostsProvider>(
      update: (BuildContext contxt,
          PostsRemoteDataSourceImpl remoteDataSourceImpl,
          PostsLocalDataSourceImpl localDataSourceImpl,
          NetWorkInfoImpl netWorkInfoImpl,
          _) {
        return PostsProvider(
          remoteDataSource: remoteDataSourceImpl,
          localDataSource: localDataSourceImpl,
          networkInfo: netWorkInfoImpl,
        );
      },
    )
  ];
}
