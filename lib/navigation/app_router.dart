import 'package:auto_route/auto_route.dart';
import 'package:friend_task_share/ui/add_task_screen.dart';
import 'package:friend_task_share/ui/detail_screen.dart';
import 'package:friend_task_share/ui/gohobi_screen.dart';
import 'package:friend_task_share/ui/home_screen.dart';
import 'package:friend_task_share/ui/mytask_screen.dart';
import 'package:friend_task_share/ui/title_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: TitleScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: MyTaskScreen),
    AutoRoute(page: DetailScreen),
    AutoRoute(page: GohobiScreen),
    AutoRoute(page: AddTaskScreen),
  ],
)
class $AppRouter {}
