import '../domain/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/task_repository.dart';

class DetailTaskViewModel extends StateNotifier<AsyncValue<Task>> {
  DetailTaskViewModel(this._taskRepository) : super(const AsyncValue.loading());

  final TaskRepository _taskRepository;

  Future<void> fetchTask(String taskId) async {
    state = const AsyncValue.loading();
    await _taskRepository.fetchTask(taskId).then((result) {
      result.when(success: ((value) {
        state = AsyncValue.data(value);
      }), failure: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      });
    });
  }

  Future<void> doneTask() async {
    await _taskRepository.doneTask(state.value!.uid);
  }
}
