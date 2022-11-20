import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_data_viewmodel.dart';

class GooglSignInNotifier extends StateNotifier<FirebaseAuth> {
  GooglSignInNotifier(this._read) : super(FirebaseAuth.instance);
  final _googleSignIn = GoogleSignIn();
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

      await state.signInWithCredential(credential);
      _read.initBaseData(state.currentUser!.uid,
          state.currentUser!.displayName!, state.currentUser!.photoURL!);
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
