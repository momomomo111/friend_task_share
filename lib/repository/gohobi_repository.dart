import '../api/firestore_api.dart';
import '../domain/user_data.dart';
import '../response/result.dart';

class GohobiRepository {
  GohobiRepository(this._client);
  final FirestoreApi _client;

  Future<void> addGohobi(String taskId, String userId, String message) async {
    var gohobiId = await _client
        .addGohobi(userId, message)
        .then((value) => value)
        .catchError((error) => throw error);
    await _client
        .addGohobiListId(taskId, gohobiId)
        .then((value) => value)
        .catchError((error) => throw error);
  }

  Future<Result<UserData>> fetchGohobiFromUserData(String gohobiId) async {
    var userId = await _client
        .fetchGohobiFromUserId(gohobiId)
        .then((value) => value)
        .catchError((error) => throw error);
    return await _client
        .fetchUserData(userId)
        .then((value) => Result<UserData>.success(value))
        .catchError(
            (error, stackTrace) => Result<UserData>.failure(error, stackTrace));
  }

  Future<Result<List<UserData>>> fetchGohobiListFromUserDataList(
      List<String> gohobiIdList) async {
    var userDataList = <UserData>[];
    try {
      for (var gohobiId in gohobiIdList) {
        var userData = await fetchGohobiFromUserData(gohobiId);
        userData.when(
            success: (userData) => userDataList.add(userData),
            failure: (error, stackTrace) => throw error);
      }
    } catch (error, stackTrace) {
      return Result<List<UserData>>.failure(error, stackTrace);
    }
    return Result<List<UserData>>.success(userDataList);
  }

  Future<Result<String>> fetchGohobiMessage(String gohobiId) async {
    return await _client
        .fetchGohobiMessage(gohobiId)
        .then((value) => Result<String>.success(value))
        .catchError(
            (error, stackTrace) => Result<String>.failure(error, stackTrace));
  }

  Future<Result<List<String>>> fetchGohobiListMessageList(
      List<String> gohobiIdList) async {
    var messageList = <String>[];
    try {
      for (var gohobiId in gohobiIdList) {
        var message = await _client
            .fetchGohobiMessage(gohobiId)
            .then((value) => value)
            .catchError((error) => throw error);
        messageList.add(message);
      }
    } catch (error, stackTrace) {
      return Result<List<String>>.failure(error, stackTrace);
    }
    return Result<List<String>>.success(messageList);
  }
}
