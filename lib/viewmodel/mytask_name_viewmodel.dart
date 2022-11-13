import 'package:friend_task_share/viewmodel/user_data_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/task.dart';
import '../repository/task_repository.dart';

class MyTaskNameViewModel extends StateNotifier<AsyncValue<List<Task>>> {
  MyTaskNameViewModel(this._taskRepository, this._userDataViewModel)
      : super(const AsyncValue.loading()) {
    fetchTaskList();
  }
  final TaskRepository _taskRepository;
  final UserDataViewModel _userDataViewModel;

  void fetchTaskList() async {
    final uid = _userDataViewModel.state.value!.uid;
    await _taskRepository.fetchTaskList(uid).then((result) {
      result.when(success: ((value) {
        state = AsyncValue.data(value);
      }), failure: (error) {
        state = AsyncValue.error(error);
      });
    });
  }
}
