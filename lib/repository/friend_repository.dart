import '../domain/user_data.dart';
import '../response/result.dart';

import '../api/firestore_api.dart';

class FriendRepository {
  FriendRepository(this._client);

  final FirestoreApi _client;

  Future<Result<UserData>> fetchUserData(String uid) async {
    return await _client
        .fetchUserData(uid)
        .then((friendUserData) => Result<UserData>.success(friendUserData))
        .catchError((error) => Result<UserData>.failure(error));
  }

  Future<void> addFriendUser(String uid, String friendUid) async {
    await _client.addFriendUser(uid, friendUid);
    await _client.addFriendUser(friendUid, uid);
  }
}
