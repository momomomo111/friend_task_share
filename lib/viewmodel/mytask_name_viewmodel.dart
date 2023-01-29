import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/task.dart';
import '../repository/task_repository.dart';
import 'user_data_viewmodel.dart';

class MyTaskNameViewModel extends StateNotifier<AsyncValue<List<Task>>> {
  MyTaskNameViewModel(this._taskRepository, this._userDataViewModel)
      : super(const AsyncValue.loading()) {
    fetchTaskList();
  }
  final TaskRepository _taskRepository;
  final UserDataViewModel _userDataViewModel;

  Future<void> fetchTaskList() async {
    final uid = _userDataViewModel.state.uid;
    await _taskRepository.fetchTaskList(uid).then((result) {
      result.when(success: ((value) {
        state = AsyncValue.data(value);
      }), failure: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      });
    });
  }

  Future<void> submitTask(String uid, String taskName,
      List<String> smallTaskList, DateTime deadline) async {
    await _taskRepository.addTask(uid, taskName, smallTaskList, deadline);
  }
}
