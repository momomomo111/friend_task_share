import 'package:hooks_riverpod/hooks_riverpod.dart';

class FriendTaskNameViewModel extends StateNotifier<List<String>> {
  FriendTaskNameViewModel()
      : super([
          "友達のタスク名1",
          "友達のタスク名2",
          "友達のタスク名3",
          "友達のタスク名4",
          "友達のタスク名5",
          "友達のタスク名6",
          "友達のタスク名7",
          "友達のタスク名8",
          "友達のタスク名9",
          "友達のタスク名10",
          "友達のタスク名11"
        ]);

  void add(value) {
    state.add(value);
  }
}
