import 'package:flutter/material.dart';
import 'package:friend_task_share/navigation/route_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RoutePage(),
    ),
  );
}
