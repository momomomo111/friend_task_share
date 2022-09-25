// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../ui/add_task_screen.dart' as _i6;
import '../ui/add_user_screen.dart' as _i7;
import '../ui/detail_screen.dart' as _i4;
import '../ui/gohobi_screen.dart' as _i5;
import '../ui/home_screen.dart' as _i2;
import '../ui/mytask_screen.dart' as _i3;
import '../ui/login_screen.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    TitleRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    MyTaskRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MyTaskScreen());
    },
    DetailRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DetailScreen());
    },
    GohobiRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.GohobiScreen());
    },
    AddTaskRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AddTaskScreen());
    },
    AddUserRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AddUserScreen());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(TitleRoute.name, path: '/'),
        _i8.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i8.RouteConfig(MyTaskRoute.name, path: '/my-task-screen'),
        _i8.RouteConfig(DetailRoute.name, path: '/detail-screen'),
        _i8.RouteConfig(GohobiRoute.name, path: '/gohobi-screen'),
        _i8.RouteConfig(AddTaskRoute.name, path: '/add-task-screen'),
        _i8.RouteConfig(AddUserRoute.name, path: '/add-user-screen')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class TitleRoute extends _i8.PageRouteInfo<void> {
  const TitleRoute() : super(TitleRoute.name, path: '/');

  static const String name = 'TitleRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.MyTaskScreen]
class MyTaskRoute extends _i8.PageRouteInfo<void> {
  const MyTaskRoute() : super(MyTaskRoute.name, path: '/my-task-screen');

  static const String name = 'MyTaskRoute';
}

/// generated route for
/// [_i4.DetailScreen]
class DetailRoute extends _i8.PageRouteInfo<void> {
  const DetailRoute() : super(DetailRoute.name, path: '/detail-screen');

  static const String name = 'DetailRoute';
}

/// generated route for
/// [_i5.GohobiScreen]
class GohobiRoute extends _i8.PageRouteInfo<void> {
  const GohobiRoute() : super(GohobiRoute.name, path: '/gohobi-screen');

  static const String name = 'GohobiRoute';
}

/// generated route for
/// [_i6.AddTaskScreen]
class AddTaskRoute extends _i8.PageRouteInfo<void> {
  const AddTaskRoute() : super(AddTaskRoute.name, path: '/add-task-screen');

  static const String name = 'AddTaskRoute';
}

/// generated route for
/// [_i7.AddUserScreen]
class AddUserRoute extends _i8.PageRouteInfo<void> {
  const AddUserRoute() : super(AddUserRoute.name, path: '/add-user-screen');

  static const String name = 'AddUserRoute';
}
