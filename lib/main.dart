import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friend_task_share/api/firestore_api.dart';
import 'package:friend_task_share/repository/task_repository.dart';
import 'package:friend_task_share/repository/user_repository.dart';
import 'domain/user_data.dart';
import 'viewmodel/user_data_viewmodel.dart';
import 'domain/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';
import 'navigation/route_page.dart';
import 'viewmodel/friendtask_name_viewmodel.dart';
import 'viewmodel/google_signin_notifier.dart';
import 'viewmodel/mytask_name_viewmodel.dart';

final fireStoreApiProvider = Provider.autoDispose((ref) => FirestoreApi());

final taskRepositoryProvider = Provider.autoDispose(
    (ref) => TaskRepository(ref.read(fireStoreApiProvider)));

final userRepositoryProvider = Provider.autoDispose(
    (ref) => UserRepository(ref.read(fireStoreApiProvider)));

final friendtaskNameProvider =
    StateNotifierProvider<FriendTaskNameViewModel, AsyncValue<List<Task>>>(
        (ref) => FriendTaskNameViewModel(
              ref.read(taskRepositoryProvider),
              ref.read(userDataProvider.notifier),
            ));

final mytaskNameProvider =
    StateNotifierProvider<MyTaskNameViewModel, AsyncValue<List<Task>>>(
        (ref) => MyTaskNameViewModel(
              ref.read(taskRepositoryProvider),
              ref.read(userDataProvider.notifier),
            ));

final googlSignInProvider = ChangeNotifierProvider(
    (ref) => GooglSignInNotifier(ref.read(userDataProvider.notifier)));

final userDataProvider = StateNotifierProvider<UserDataViewModel, UserData>(
    (ref) => UserDataViewModel(ref.read(userRepositoryProvider)));

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
