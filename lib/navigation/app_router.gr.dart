// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../domain/task.dart' as _i11;
import '../ui/add_task_screen.dart' as _i7;
import '../ui/add_user_screen.dart' as _i8;
import '../ui/detail_screen.dart' as _i5;
import '../ui/friendtask_screen.dart' as _i3;
import '../ui/gohobi_screen.dart' as _i6;
import '../ui/home_screen.dart' as _i2;
import '../ui/login_screen.dart' as _i1;
import '../ui/mytask_screen.dart' as _i4;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    FriendTaskScren.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.FriendTaskScren());
    },
    MyTaskRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MyTaskScreen());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.DetailScreen(key: args.key, task: args.task));
    },
    GohobiRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.GohobiScreen());
    },
    AddTaskRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AddTaskScreen());
    },
    AddUserRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AddUserScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i9.RouteConfig(HomeRoute.name, path: '/'),
        _i9.RouteConfig(FriendTaskScren.name, path: '/friend-task-scren'),
        _i9.RouteConfig(MyTaskRoute.name, path: '/my-task-screen'),
        _i9.RouteConfig(DetailRoute.name, path: '/detail-screen'),
        _i9.RouteConfig(GohobiRoute.name, path: '/gohobi-screen'),
        _i9.RouteConfig(AddTaskRoute.name, path: '/add-task-screen'),
        _i9.RouteConfig(AddUserRoute.name, path: '/add-user-screen')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.FriendTaskScren]
class FriendTaskScren extends _i9.PageRouteInfo<void> {
  const FriendTaskScren()
      : super(FriendTaskScren.name, path: '/friend-task-scren');

  static const String name = 'FriendTaskScren';
}

/// generated route for
/// [_i4.MyTaskScreen]
class MyTaskRoute extends _i9.PageRouteInfo<void> {
  const MyTaskRoute() : super(MyTaskRoute.name, path: '/my-task-screen');

  static const String name = 'MyTaskRoute';
}

/// generated route for
/// [_i5.DetailScreen]
class DetailRoute extends _i9.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i10.Key? key, required _i11.Task task})
      : super(DetailRoute.name,
            path: '/detail-screen',
            args: DetailRouteArgs(key: key, task: task));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.task});

  final _i10.Key? key;

  final _i11.Task task;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i6.GohobiScreen]
class GohobiRoute extends _i9.PageRouteInfo<void> {
  const GohobiRoute() : super(GohobiRoute.name, path: '/gohobi-screen');

  static const String name = 'GohobiRoute';
}

/// generated route for
/// [_i7.AddTaskScreen]
class AddTaskRoute extends _i9.PageRouteInfo<void> {
  const AddTaskRoute() : super(AddTaskRoute.name, path: '/add-task-screen');

  static const String name = 'AddTaskRoute';
}

/// generated route for
/// [_i8.AddUserScreen]
class AddUserRoute extends _i9.PageRouteInfo<void> {
  const AddUserRoute() : super(AddUserRoute.name, path: '/add-user-screen');

  static const String name = 'AddUserRoute';
}
