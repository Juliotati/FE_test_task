part of core;

List<SingleChildWidget> provider() {
  return <SingleChildWidget>[
    ListenableProvider<PostsNetwork>(create: (BuildContext context) {
      return PostsNetwork();
    }),
    Provider<NetWorkInfoImpl>(create: (BuildContext context) {
      return NetWorkInfoImpl.instance;
    }),
  ];
}
