import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class FirestoreApi {
  CollectionReference users = firestore.collection('users');
  CollectionReference tasks = firestore.collection('tasks');
  CollectionReference gohobis = firestore.collection('gohobis');

  // Future<dynamic> getFriendUserId(String uid) {
  //   return users.doc(uid).get().then(
  //       (value) => (value.data() as Map<String, dynamic>)["friendUserId"]);
  // }
}
