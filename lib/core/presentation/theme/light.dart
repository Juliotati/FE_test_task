part of core;

final ThemeData lightThemeData = ThemeData(
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FEPageTransitionAnimation(),
      TargetPlatform.iOS: FEPageTransitionAnimation(),
    },
  ),
  primaryColor: Colors.amber[50],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.amber[200],
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    refreshBackgroundColor: Colors.amber[50],
    color: Colors.amber[100],
    circularTrackColor: Colors.amber[400],
  ),
  scaffoldBackgroundColor: Colors.white,
  highlightColor: Colors.white24,
  splashColor: Colors.transparent,
  cardTheme: CardTheme(
    elevation: 5.0,
    shadowColor: Colors.amber[50],
    margin: const EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 10.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
