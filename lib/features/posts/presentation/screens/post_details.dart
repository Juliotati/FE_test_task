part of posts;

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);
  static const String route = 'post-details';

  @override
  Widget build(BuildContext context) {
    final PostModel post =
        ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      backgroundColor: post.id.isEven ? Colors.blue[50] : Colors.green[50],
        appBar: AppBar(
          title: const Text('Post Details'),
          backgroundColor: post.id.isEven ? Colors.blue[200] : Colors.green[200],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 40),
            children: <Widget>[
              Text(
                post.title,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 0.7),
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
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ],
          ),
        ));
  }
}
