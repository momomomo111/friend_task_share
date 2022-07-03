import 'package:flutter/material.dart';
import 'package:friend_task_share/ui/detail_screen.dart';
import 'package:friend_task_share/ui/title_screen.dart';
import 'package:friend_task_share/ui/unknown_screen.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const TitleScreen());
        }

        // Handle '/detail'
        if (settings.name == '/detail') {
          return MaterialPageRoute(builder: (context) => const DetailScreen());
        }

        return MaterialPageRoute(builder: (context) => const UnknownScreen());
      },
    );
  }
}
