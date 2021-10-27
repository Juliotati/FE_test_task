part of posts;

class PostBuilder extends StatelessWidget {
  const PostBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final Widget Function(List<PostModel>?) builder;
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsNetwork>(
      builder: (_, PostsNetwork postNetwork, __) {
        if (postNetwork.state == PostState.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (postNetwork.state == PostState.empty) {
          return const Center(child: Text('No Posts Available'));
        } else {
          return builder(postNetwork.data);
        }
      },
    );
  }
}
