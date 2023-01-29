import '../api/firestore_api.dart';
import '../domain/task.dart';
import '../response/result.dart';

class TaskRepository {
  TaskRepository(this._client);

  final FirestoreApi _client;

  Future<Result<List<String>>> fetchFriendUserId(String uid) async {
    return await _client
        .fetchFriendUserId(uid)
        .then((friendUserId) => Result<List<String>>.success(friendUserId))
        .catchError((error, stackTrace) =>
            Result<List<String>>.failure(error, stackTrace));
  }

  Future<Result<List<String>>> fetchFriendTaskIdList(
      List<String> uidList) async {
    var friendTaskList = <String>[];
    try {
      for (var element in uidList) {
        var taskList = await _client
            .fetchTaskIdList(element)
            .then((value) => value)
            .catchError((error) => error);
        friendTaskList.addAll(taskList);
      }
    } catch (error, stackTrace) {
      return Result<List<String>>.failure(error, stackTrace);
    }
    return Result<List<String>>.success(friendTaskList);
  }

  Future<Result<List<Task>>> fetchTaskList(String uid) async {
    var taskList = <Task>[];
    try {
      var taskIdList = await _client
          .fetchTaskIdList(uid)
          .then((value) => value)
          .catchError((error) => throw error);

      for (var element in taskIdList) {
        var task = await _client
            .fetchTask(element)
            .then((value) => value)
            .catchError((error) => throw error);
        taskList.add(task);
      }
    } catch (error, stackTrace) {
      return Result<List<Task>>.failure(error, stackTrace);
    }
    return Result<List<Task>>.success(taskList);
  }

  Future<Result<List<Task>>> fetchFriendTaskList(String uid) async {
    var taskList = <Task>[];
    try {
      var friendUserIdList = await fetchFriendUserId(uid).then((result) {
        return result.when(
            success: (value) => value,
            failure: (error, stackTrace) => throw error);
      });
      var friendTaskIdList =
          await fetchFriendTaskIdList(friendUserIdList).then((result) {
        return result.when(
            success: (value) => value,
            failure: (error, stackTrace) => throw error);
      });

      for (var element in friendTaskIdList) {
        var task = await _client
            .fetchTask(element)
            .then((value) => value)
            .catchError((error) => throw error);
        taskList.add(task);
      }
    } catch (error, stackTrace) {
      return Result<List<Task>>.failure(error, stackTrace);
    }
    return Result<List<Task>>.success(taskList);
  }

  Future<void> addTask(String uid, String taskName, List<String> smallTaskList,
      DateTime deadline) async {
    var taskId = await _client.addTask(taskName, smallTaskList, deadline);
    await _client.addTaskId(uid, taskId);
  }

  Future<void> doneTask(String taskId) async {
    await _client.updateTaskIsDone(taskId, true);
  }

  Future<Result<Task>> fetchTask(String taskId) async {
    return await _client
        .fetchTask(taskId)
        .then((value) => Result<Task>.success(value))
        .catchError(
            (error, stackTrace) => Result<Task>.failure(error, stackTrace));
  }
}
