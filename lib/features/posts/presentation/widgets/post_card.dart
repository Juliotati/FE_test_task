part of posts;

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return PostCardDecoration(
      key: ValueKey<String>('post-${post.id}'),
      post: post,
      child: Text(
        post.title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class PostCardDecoration extends StatelessWidget {
  const PostCardDecoration({
    Key? key,
    required this.post,
    required this.child,
  }) : super(key: key);

  final PostModel post;
  final Widget child;

  void navigateToPostDetails(BuildContext context) {
    context.pushRoute(PostDetailsRoute(post: post));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      elevation: 8.0,
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => navigateToPostDetails(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
