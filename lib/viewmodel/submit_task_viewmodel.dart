import 'package:flutter/material.dart';
import 'user_data_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/task.dart';
import '../repository/task_repository.dart';

class SubmitTaskViewModel extends StateNotifier<Task> {
  SubmitTaskViewModel(
    this._taskRepository,
    this._userDataViewModel,
    this._taskNameController,
    this._smallTaskController1,
    this._smallTaskController2,
    this._smallTaskController3,
  ) : super(Task(
            uid: "",
            taskName: "",
            deadline: DateTime.now(),
            smallTaskName: [],
            gohobiListId: []));
  final TaskRepository _taskRepository;
  final UserDataViewModel _userDataViewModel;
  final TextEditingController _taskNameController;
  final TextEditingController _smallTaskController1;
  final TextEditingController _smallTaskController2;
  final TextEditingController _smallTaskController3;

  void setDeadline(DateTime deadline) {
    state = state.copyWith(deadline: deadline);
  }

  Future<void> submitTask() async {
    final uid = _userDataViewModel.state.uid;
    final taskName = _taskNameController.text;
    final smallTaskList = [
      _smallTaskController1.text,
      _smallTaskController2.text,
      _smallTaskController3.text
    ];
    final deadline = state.deadline;
    await _taskRepository.addTask(uid, taskName, smallTaskList, deadline);
  }
}
