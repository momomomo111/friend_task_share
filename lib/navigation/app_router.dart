import 'package:auto_route/auto_route.dart';

import '../ui/add_task_screen.dart';
import '../ui/add_user_screen.dart';
import '../ui/detail_screen.dart';
import '../ui/friendtask_screen.dart';
import '../ui/gohobi_screen.dart';
import '../ui/home_screen.dart';
import '../ui/login_screen.dart';
import '../ui/mytask_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen),
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: FriendTaskScren),
    AutoRoute(page: MyTaskScreen),
    AutoRoute(page: DetailScreen),
    AutoRoute(page: GohobiScreen),
    AutoRoute(page: AddTaskScreen),
    AutoRoute(page: AddUserScreen),
  ],
)
class $AppRouter {}
