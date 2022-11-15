import '../api/firestore_api.dart';

class UserRepository {
  UserRepository(this._client);
  final FirestoreApi _client;

  Future<void> createUserData(String uid, String name, String imageUrl) async {
    try {
      await _client.fetchFriendUserId(uid);
      await _client.fetchTaskIdList(uid);
    } catch (e) {
      await _client.createUserData(uid, name, imageUrl);
    }
  }
}
