import 'package:friend_task_share/api/firestore_api.dart';
import 'package:friend_task_share/response/result.dart';

import '../domain/task.dart';

class TaskRepository {
  TaskRepository(this._client);

  final FirestoreApi _client;

  Future<Result<List<String>>> fetchFriendUserId(String uid) async {
    return await _client
        .fetchFriendUserId(uid)
        .then((friendUserId) => Result<List<String>>.success(friendUserId))
        .catchError((error) => Result<List<String>>.failure(error));
  }

  Future<Result<List<String>>> fetchFriendTaskIdList(
      List<String> uidList) async {
    var friendTaskList = <String>[];
    for (var element in uidList) {
      var taskList = await _client
          .fetchTaskIdList(element)
          .then((value) => value)
          .catchError((error) => error);
      friendTaskList.addAll(taskList);
    }
    return Result<List<String>>.success(friendTaskList);
  }

  Future<Result<List<Task>>> fetchTaskList(String uid) async {
    var taskIdList = await _client
        .fetchTaskIdList(uid)
        .then((value) => value)
        .catchError((error) => throw error);
    var taskList = await _client
        .fetchTaskList(taskIdList)
        .then((value) => value)
        .catchError((error) => throw error);
    return Result<List<Task>>.success(taskList);
  }

  Future<Result<List<Task>>> fetchFriendTaskList(String uid) async {
    var friendUserIdList = await fetchFriendUserId(uid).then((result) {
      return result.when(
          success: (value) => value, failure: (error) => throw error);
    });
    var friendTaskIdList =
        await fetchFriendTaskIdList(friendUserIdList).then((result) {
      return result.when(
          success: (value) => value, failure: (error) => throw error);
    });
    return await _client
        .fetchTaskList(friendTaskIdList)
        .then((value) => Result<List<Task>>.success(value))
        .catchError((error) => Result<List<Task>>.failure(error));
  }
}
