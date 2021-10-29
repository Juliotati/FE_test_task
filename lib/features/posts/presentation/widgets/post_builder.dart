part of posts;

class PostBuilder extends StatelessWidget {
  const PostBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(List<PostModel>) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (_, PostsProvider postsProvider, Widget? loadingIndicator) {
        if (postsProvider.state == PostState.loading) {
          return loadingIndicator!;
        }
        if (postsProvider.state == PostState.loaded &&
            postsProvider.data!.isEmpty) {
          return const Center(child: Text('No Posts Available'));
        }
        if (postsProvider.hasError || postsProvider.data == null) {
          return const Center(child: Text(' not get posts'));
        }
        if (postsProvider.state == PostState.empty) {
          return const Center(child: Text('No Posts Available'));
        } else {
          return builder(postsProvider.data!);
        }
      },
      child: const Center(
        child: SizedBox(
          height: 28,
          width: 28,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 5.0,
          ),
        ),
      ),
    );
  }
}
