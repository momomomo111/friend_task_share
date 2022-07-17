import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyTaskNameViewModel extends StateNotifier<List<String>> {
  MyTaskNameViewModel()
      : super([
          "自分のタスク名1",
          "自分のタスク名2",
          "自分のタスク名3",
          "自分のタスク名4",
          "自分のタスク名5",
          "自分のタスク名6",
          "自分のタスク名7",
          "自分のタスク名8",
          "自分のタスク名9",
          "自分のタスク名10",
          "自分のタスク名11"
        ]);

  void add(value) {
    state.add(value);
  }
}
