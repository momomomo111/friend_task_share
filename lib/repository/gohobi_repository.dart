import '../api/firestore_api.dart';

class GohobiRepository {
  GohobiRepository(this._client);
  final FirestoreApi _client;

  Future<void> addGohobi(String taskId, String userId, String message) async {
    var gohobiId = await _client.addGohobi(userId, message);
    await _client.addGohobiListId(taskId, gohobiId);
  }
}
