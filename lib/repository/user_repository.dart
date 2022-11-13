import '../api/firestore_api.dart';

class UserRepository {
  UserRepository(this._client);
  final FirestoreApi _client;

  Future<void> createUserData(String uid, String name, String imageUrl) async {
    await _client.createUserData(uid, name, imageUrl);
  }
}
