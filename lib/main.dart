import 'package:flutter/material.dart';
import 'package:friend_task_share/navigation/route_page.dart';
import 'package:friend_task_share/viewmodel/task_name_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskNameProvider = StateNotifierProvider<TaskNameViewModel, List<String>>(
    (_) => TaskNameViewModel());

void main() {
  runApp(
    const ProviderScope(
      child: RoutePage(),
    ),
  );
}
