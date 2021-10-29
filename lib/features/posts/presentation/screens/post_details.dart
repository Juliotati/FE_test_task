part of posts;

class PostDetails extends StatelessWidget {
  const PostDetails({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey<String>('post-details'),
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 40),
          children: <Widget>[
            Text(
              post.title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.amber[600],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'by: ${post.userId}',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 10),
            Text(
              post.body,
              softWrap: true,
              style: GoogleFonts.notoSans(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
