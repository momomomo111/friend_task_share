import 'package:flutter/material.dart';

import 'app_router.gr.dart';

class RoutePage extends StatelessWidget {
  RoutePage({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
