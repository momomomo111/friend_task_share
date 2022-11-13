import 'package:friend_task_share/api/firestore_api.dart';
import 'package:friend_task_share/response/result.dart';

import '../domain/task.dart';

class FriendTaskRepository {
  FriendTaskRepository(this._client);

  final FirestoreApi _client;

  Future<Result<List<String>>> fetchFriendUserId(String uid) async {
    return _client
        .fetchFriendUserId(uid)
        .then((friendUserId) => Result<List<String>>.success(friendUserId))
        .catchError((error) => Result<List<String>>.failure(error));
  }

  Future<Result<List<String>>> fetchFriendTaskList(List<String> uidList) async {
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

  Future<Result<List<Task>>> fetchFriendUserDataList(String uid) async {
    var friendUserIdList = await fetchFriendUserId(uid).then((result) {
      return result.when(
          success: (value) => value, failure: (error) => throw error);
    });
    var friendTaskIdList =
        await fetchFriendTaskList(friendUserIdList).then((result) {
      return result.when(
          success: (value) => value, failure: (error) => throw error);
    });
    var friendTaskList = await _client
        .fetchTaskList(friendTaskIdList)
        .then((value) => value)
        .catchError((error) => throw error);
    print("friendTaskList: ${friendTaskList.toString()}");
    return Result.success(friendTaskList);
  }
}
