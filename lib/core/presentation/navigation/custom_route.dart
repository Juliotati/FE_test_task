part of core;

class FEPageTransitionAnimation extends ZoomPageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return SharedAxisTransition(
      animation: animation,
      fillColor: Colors.amber[50],
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
      child: child,
    );
  }
}
