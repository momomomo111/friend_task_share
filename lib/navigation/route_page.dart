import 'package:flutter/material.dart';
import 'package:friend_task_share/ui/detail_screen.dart';
import 'package:friend_task_share/ui/gohobi_screen.dart';
import 'package:friend_task_share/ui/home_screen.dart';
import 'package:friend_task_share/ui/mytask_screen.dart';
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

        // Handle '/gohobi'
        if (settings.name == '/gohobi') {
          return MaterialPageRoute(
              builder: (context) => const SafeArea(child: GohobiScreen()));
        }

        // Handle '/mytask'
        if (settings.name == '/mytask') {
          return MaterialPageRoute(
              builder: (context) => const SafeArea(child: MyTaskScreen()));
        }

        // Handle '/unknown'
        return MaterialPageRoute(
            builder: (context) => const SafeArea(child: UnknownScreen()));
      },
    );
  }
}
