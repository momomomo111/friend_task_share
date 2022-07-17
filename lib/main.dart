import 'package:flutter/material.dart';
import 'package:friend_task_share/navigation/route_page.dart';
import 'package:friend_task_share/viewmodel/friendtask_name_viewmodel.dart';
import 'package:friend_task_share/viewmodel/mytask_name_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final friendtaskNameProvider =
    StateNotifierProvider<FriendTaskNameViewModel, List<String>>(
        (_) => FriendTaskNameViewModel());

final mytaskNameProvider =
    StateNotifierProvider<MyTaskNameViewModel, List<String>>(
        (_) => MyTaskNameViewModel());

void main() {
  runApp(
    const ProviderScope(
      child: RoutePage(),
    ),
  );
}
