import 'package:fe_test_task/core/config/routes/routes.gr.dart';
import 'package:fe_test_task/core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FETestApp extends StatelessWidget {
  const FETestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FERouter _router = FERouter();
    return MultiProvider(
      providers: provider(),
      child: MaterialApp.router(
        title: 'FE Posts',
        theme: lightThemeData,
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
        routeInformationProvider: _router.routeInfoProvider(),
      ),
    );
  }
}
