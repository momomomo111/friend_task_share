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
              .cast<String>());
    });
  }

  Future<void> createUserData(String uid, String name, String imageUrl) async {
    users
        .doc(uid)
        .set({"name": name, "imageUrl": imageUrl}, SetOptions(merge: true));
  }

  Future<UserData> fetchUserData(String uid) async {
    try {
      var userData = await users.doc(uid).get().then((value) {
        return UserData(
            uid: value.id,
            name: (value.data() as Map<String, dynamic>)["name"],
            imageUrl: (value.data() as Map<String, dynamic>)["imageUrl"]);
      });
      return userData;
    } catch (error) {
      return UserData(uid: uid, name: "unknown", imageUrl: "");
    }
  }

  Future<void> addFriendUser(String uid, String friendUid) async {
    await users.doc(uid).update({
      "friendUserId": FieldValue.arrayUnion([friendUid])
    });
  }
}
