import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskNameViewModel extends StateNotifier<List<String>> {
  TaskNameViewModel() : super([]);

  void add(value) {
    state.add(value);
    print(state.toString());
  }
}
