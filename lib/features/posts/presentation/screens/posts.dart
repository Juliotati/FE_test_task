part of posts;

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);
  static const String route = 'posts';

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Future<void> getPosts() async {
    final bool isConnected = await NetWorkInfoImpl.instance.isConnected;
    if (isConnected) {
      context.read<PostsNetwork>().getPosts();
      return;
    }
    context.read<NetWorkInfoImpl>().noConnectionWarning(context);
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Posts'),
        actions: [
          InkWell(
            onTap: () async => getPosts(),
            child:const Padding(
              padding:  EdgeInsets.all(16.0),
              child:  Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => getPosts(),
        child: PostBuilder(
          builder: (List<PostModel>? posts) {
            return ListView.builder(itemBuilder: (_, int i) {
              final PostModel post = posts![i];
              return PostCard(
                key: ValueKey<int>(post.id),
                post: post,
              );
            });
          },
        ),
      ),
    );
  }
}
