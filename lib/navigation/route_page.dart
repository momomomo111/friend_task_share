import 'package:flutter/material.dart';
import 'package:friend_task_share/ui/detail_screen.dart';
import 'package:friend_task_share/ui/home_screen.dart';
import 'package:friend_task_share/ui/title_screen.dart';
import 'package:friend_task_share/ui/unknown_screen.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/title',
      onGenerateRoute: (settings) {
        // Handle '/title'
        if (settings.name == '/title') {
          return MaterialPageRoute(
              builder: (context) => const SafeArea(child: TitleScreen()));
        }

        // Handle '/home'
        if (settings.name == '/home') {
          return MaterialPageRoute(
              builder: (context) => const SafeArea(child: HomeScreen()));
        }

        // Handle '/detail'
        if (settings.name == '/detail') {
          return MaterialPageRoute(
              builder: (context) => const SafeArea(child: DetailScreen()));
        }

        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: UnknownScreen()));
      },
    );
  }
}
