import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:friend_task_share/viewmodel/user_data_viewmodel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglSignInNotifier extends ChangeNotifier {
  GooglSignInNotifier(this._read);
  final _googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;
  final UserDataViewModel _read;

  Future googleLogin(void Function() onSuccess) async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googlAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googlAuth.accessToken,
        idToken: googlAuth.idToken,
      );

      await auth.signInWithCredential(credential);
      notifyListeners();
      _read.initBaseData(auth.currentUser!.uid, auth.currentUser!.displayName!,
          auth.currentUser!.photoURL!);
      _read.createUserData();
      onSuccess();
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  Future logout(void Function() onSuccess) async {
    await _googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    onSuccess();
  }
}
