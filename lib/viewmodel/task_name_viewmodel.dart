import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskNameViewModel extends StateNotifier<List<String>> {
  TaskNameViewModel()
      : super([
          "タスク名1",
          "タスク名2",
          "タスク名3",
          "タスク名4",
          "タスク名5",
          "タスク名6",
          "タスク名7",
          "タスク名8",
          "タスク名9",
          "タスク名10",
          "タスク名11"
        ]);

  void add(value) {
    state.add(value);
  }
}
