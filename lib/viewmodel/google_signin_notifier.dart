//ChangeNotifier
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglSignInNotifier extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  FirebaseAuth get auth => _auth;

  Future googleLogin(void Function() onSuccess) async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;
      _user = googleUser;

      final GoogleSignInAuthentication googlAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googlAuth.accessToken,
        idToken: googlAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      notifyListeners();
      onSuccess();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future logout(void Function() onSuccess) async {
    await _googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    onSuccess();
  }
}
