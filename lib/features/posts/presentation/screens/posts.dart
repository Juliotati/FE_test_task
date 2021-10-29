part of posts;

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);
  static const String route = 'posts';

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  Future<void> getPosts() async {
    context.read<PostsProvider>().getPosts(context);
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
        title: const Text('Posts'),
        actions: <PostRefreshButton>[
          PostRefreshButton(
            onTap: () async => getPosts(),
          ),
        ],
      ),
      body: RefreshIndicator(
        strokeWidth: 3.0,
        color: Colors.amber[400],
        onRefresh: () async => getPosts(),
        child: PostBuilder(
          builder: (List<PostModel> posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, int i) {
                final PostModel post = posts[i];
                return PostCard(
                  key: ValueKey<int>(post.id),
                  post: post,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
