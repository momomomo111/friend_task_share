import 'package:friend_task_share/api/firestore_api.dart';
import 'package:friend_task_share/response/result.dart';

class FriendTaskRepository {
  FriendTaskRepository(this._client);

  final FirestoreApi _client;

  Future<Result<List<String>>> fetchFriendUserId(String uid) async {
    return _client
        .fetchFriendUserId(uid)
        .then((friendUserId) => Result<List<String>>.success(friendUserId))
        .catchError((error) => Result<List<String>>.failure(error));
  }
}
