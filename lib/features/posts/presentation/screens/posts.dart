part of posts;

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);
  static const String route = 'posts';

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Post'));
  }
}
