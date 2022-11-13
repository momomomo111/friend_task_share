import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/task.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  CollectionReference users = firestore.collection('users');
  CollectionReference tasks = firestore.collection('tasks');
  CollectionReference gohobis = firestore.collection('gohobis');

  Future<List<String>> fetchFriendUserId(String uid) async {
    final friendUserId = await users.doc(uid).get().then((value) =>
        (value.data() as Map<String, dynamic>)["friendUserId"].cast<String>());
    return friendUserId;
  }

  Future<List<String>> fetchTaskIdList(String uid) async {
    final taskList = await users.doc(uid).get().then((value) =>
        (value.data() as Map<String, dynamic>)["taskList"].cast<String>());
    return taskList;
  }

  Future<List<Task>> fetchTaskList(List<String> taskIdList) async {
    var taskList = <Task>[];
    for (var element in taskIdList) {
      var task = await tasks.doc(element).get().then((value) {
        return Task(
            uid: value.id,
            taskName: (value.data() as Map<String, dynamic>)["taskName"],
            deadline:
                (value.data() as Map<String, dynamic>)["deadline"].toDate(),
            smallTaskName:
                (value.data() as Map<String, dynamic>)["smallTaskList"]
                    .cast<String>(),
            gohobiListId: (value.data() as Map<String, dynamic>)["gohobiListId"]
                .cast<String>());
      });
      taskList.add(task);
    }
    return taskList;
  }
}
