import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';
import 'navigation/route_page.dart';
import 'viewmodel/friendtask_name_viewmodel.dart';
import 'viewmodel/google_signin_notifier.dart';
import 'viewmodel/mytask_name_viewmodel.dart';

final friendtaskNameProvider =
    StateNotifierProvider<FriendTaskNameViewModel, List<String>>(
        (_) => FriendTaskNameViewModel());

final mytaskNameProvider =
    StateNotifierProvider<MyTaskNameViewModel, List<String>>(
        (_) => MyTaskNameViewModel());

final googlSignInProvider =
    ChangeNotifierProvider((_) => GooglSignInNotifier());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: RoutePage(),
    ),
  );
}
