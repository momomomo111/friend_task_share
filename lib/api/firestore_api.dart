import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/user_data.dart';

import '../domain/task.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  CollectionReference users = firestore.collection('users');
  CollectionReference tasks = firestore.collection('tasks');
  CollectionReference gohobis = firestore.collection('gohobis');

  Future<List<String>> fetchFriendUserId(String uid) async {
    return await users.doc(uid).get().then((value) =>
        (value.data() as Map<String, dynamic>)["friendUserId"].cast<String>());
  }

  Future<List<String>> fetchTaskIdList(String uid) async {
    return await users.doc(uid).get().then((value) =>
        (value.data() as Map<String, dynamic>)["taskList"].cast<String>());
  }

  Future<Task> fetchTask(String taskId) async {
    return await tasks.doc(taskId).get().then((value) {
      return Task(
          uid: value.id,
          taskName: (value.data() as Map<String, dynamic>)["taskName"],
          deadline: (value.data() as Map<String, dynamic>)["deadline"].toDate(),
          smallTaskName: (value.data() as Map<String, dynamic>)["smallTaskList"]
              .cast<String>(),
          gohobiListId: (value.data() as Map<String, dynamic>)["gohobiListId"]
              .cast<String>(),
          isDone: (value.data() as Map<String, dynamic>)["isDone"]);
    });
  }

  Future<void> createUserData(String uid, String name, String imageUrl) async {
    users.doc(uid).set({
      "friendUserId": [],
      "name": name,
      "imageUrl": imageUrl,
      "taskList": []
    }, SetOptions(merge: true));
  }

  Future<UserData> fetchUserData(String uid) async {
    return await users.doc(uid).get().then((value) {
      return UserData(
          uid: value.id,
          name: (value.data() as Map<String, dynamic>)["name"],
          imageUrl: (value.data() as Map<String, dynamic>)["imageUrl"]);
    });
  }

  Future<void> addFriendUser(String uid, String friendUid) async {
    await users.doc(uid).update({
      "friendUserId": FieldValue.arrayUnion([friendUid])
    });
  }

  Future<String> addTask(
      String taskName, List<String> smallTaskList, DateTime deadline) async {
    var uid = await tasks.add({
      "taskName": taskName,
      "smallTaskList": smallTaskList,
      "deadline": deadline,
      "gohobiListId": [],
      "isDone": false
    });
    return uid.id;
  }

  Future<String> addGohobi(String fromUserId, String message) async {
    var gohobiId =
        await gohobis.add({"fromUserId": fromUserId, "message": message});
    return gohobiId.id;
  }

  Future<void> addGohobiListId(String taskId, String gohobiId) async {
    await tasks.doc(taskId).update({
      "gohobiListId": FieldValue.arrayUnion([gohobiId])
    });
  }

  Future<void> addTaskId(String uid, String taskId) async {
    await users.doc(uid).update({
      "taskList": FieldValue.arrayUnion([taskId])
    });
  }

  Future<String> fetchGohobiFromUserId(String gohobiId) async {
    return await gohobis.doc(gohobiId).get().then((value) {
      return (value.data() as Map<String, dynamic>)["fromUserId"];
    });
  }

  Future<void> updateTaskIsDone(String taskId, bool isDone) async {
    await tasks.doc(taskId).update({"isDone": isDone});
  }

  Future<String> fetchGohobiMessage(String gohobiId) async {
    return await gohobis.doc(gohobiId).get().then((value) {
      return (value.data() as Map<String, dynamic>)["message"];
    });
  }
}
