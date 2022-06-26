import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskNameProvider =
    StateNotifierProvider<TaskName, String>((_) => TaskName());

class TaskName extends StateNotifier<String> {
  TaskName() : super("");

  void set(text) => state = text;
}
