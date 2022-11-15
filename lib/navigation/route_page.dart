import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_router.gr.dart';

class RoutePage extends StatelessWidget {
  RoutePage({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
