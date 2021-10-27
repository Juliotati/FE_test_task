part of posts;

class PostRefreshButton extends StatelessWidget {
  const PostRefreshButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
