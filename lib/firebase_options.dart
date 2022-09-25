// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD9SjcRgQonXGLEQy1ZC2EVX9_ACCWD21M',
    appId: '1:1044762692991:web:5715ff5f006ed22d3b1e4a',
    messagingSenderId: '1044762692991',
    projectId: 'friend-task-share',
    authDomain: 'friend-task-share.firebaseapp.com',
    storageBucket: 'friend-task-share.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAodsSWgDguZVHeLnczCxrfYVFISkik6oo',
    appId: '1:1044762692991:android:bb7568529c4f43523b1e4a',
    messagingSenderId: '1044762692991',
    projectId: 'friend-task-share',
    storageBucket: 'friend-task-share.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeQX9en_K8ELlELJDy5VwAlJZ2y470_7I',
    appId: '1:1044762692991:ios:56af9b7f6d1f9fd93b1e4a',
    messagingSenderId: '1044762692991',
    projectId: 'friend-task-share',
    storageBucket: 'friend-task-share.appspot.com',
    iosClientId: '1044762692991-o1homcc46patstudc9mnk0p2i8m3k1e6.apps.googleusercontent.com',
    iosBundleId: 'com.momomomo111.friendTaskShare',
  );
}
