import 'package:cloud_firestore/cloud_firestore.dart';

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
}
