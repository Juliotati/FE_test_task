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
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shadowColor: const Color.fromRGBO(255, 225, 225, 1.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.of(context).pushNamed(
            PostDetails.route,
            arguments: post,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            post.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
