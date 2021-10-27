part of posts;

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.4),
      color: post.id.isEven ? Colors.blue[100] : Colors.green[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      elevation: 8.0,
      child: Card(
        margin: const EdgeInsets.only(top: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.of(context).pushNamed(
              PostDetails.route,
              arguments: post,
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              post.title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ),
    );
  }
}
