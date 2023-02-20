import 'user_data_viewmodel.dart';

import '../domain/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/task_repository.dart';

class FriendTaskNameViewModel extends StateNotifier<AsyncValue<List<Task>>> {
  FriendTaskNameViewModel(this._taskRepository, this._userDataViewModel)
      : super(const AsyncValue.loading()) {
    fetchTaskList();
  }
  final TaskRepository _taskRepository;
  final UserDataViewModel _userDataViewModel;

  Future<void> fetchTaskList() async {
    final uid = _userDataViewModel.state.uid;
    await _taskRepository.fetchFriendTaskList(uid).then((result) {
      result.when(success: ((value) {
        state = AsyncValue.data(value);
      }), failure: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      });
    });
  }
}
