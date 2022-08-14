import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigation/route_page.dart';
import 'viewmodel/friendtask_name_viewmodel.dart';
import 'viewmodel/mytask_name_viewmodel.dart';

final friendtaskNameProvider =
    StateNotifierProvider<FriendTaskNameViewModel, List<String>>(
        (_) => FriendTaskNameViewModel());

final mytaskNameProvider =
    StateNotifierProvider<MyTaskNameViewModel, List<String>>(
        (_) => MyTaskNameViewModel());

void main() {
  runApp(
    ProviderScope(
      child: RoutePage(),
    ),
  );
}
