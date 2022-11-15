import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friend_task_share/viewmodel/detail_task_viewmodel.dart';
import 'package:friend_task_share/viewmodel/gohobi_user_data_viewmodel.dart';
import 'package:friend_task_share/viewmodel/gohobi_viewmodel.dart';
import 'repository/friend_repository.dart';
import 'repository/gohobi_repository.dart';
import 'viewmodel/search_user_data_viewmodel.dart';
import 'viewmodel/submit_gohobi_viewmodel.dart';
import 'viewmodel/submit_task_viewmodel.dart';
import 'api/firestore_api.dart';
import 'domain/gohobi.dart';
import 'repository/task_repository.dart';
import 'repository/user_repository.dart';
import 'domain/user_data.dart';
import 'viewmodel/user_data_viewmodel.dart';
import 'domain/task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';
import 'navigation/route_page.dart';
import 'viewmodel/friendtask_name_viewmodel.dart';
import 'viewmodel/google_signin_notifier.dart';
import 'viewmodel/mytask_name_viewmodel.dart';

// Api
final fireStoreApiProvider = Provider.autoDispose((ref) => FirestoreApi());

// Repository
final taskRepositoryProvider = Provider.autoDispose(
    (ref) => TaskRepository(ref.read(fireStoreApiProvider)));

final userRepositoryProvider = Provider.autoDispose(
    (ref) => UserRepository(ref.read(fireStoreApiProvider)));

final friendRepositoryProvider = Provider.autoDispose(
    (ref) => FriendRepository(ref.read(fireStoreApiProvider)));

final gohobiRepositoryProvider = Provider.autoDispose(
    (ref) => GohobiRepository(ref.read(fireStoreApiProvider)));

// ViewModel
final friendtaskNameProvider = StateNotifierProvider.autoDispose<
        FriendTaskNameViewModel, AsyncValue<List<Task>>>(
    (ref) => FriendTaskNameViewModel(
          ref.read(taskRepositoryProvider),
          ref.read(userDataProvider.notifier),
        ));

final mytaskNameProvider = StateNotifierProvider
    .autoDispose<MyTaskNameViewModel, AsyncValue<List<Task>>>(
        (ref) => MyTaskNameViewModel(
              ref.read(taskRepositoryProvider),
              ref.read(userDataProvider.notifier),
            ));

final googlSignInProvider = ChangeNotifierProvider.autoDispose(
    (ref) => GooglSignInNotifier(ref.read(userDataProvider.notifier)));

final userDataProvider = StateNotifierProvider<UserDataViewModel, UserData>(
    (ref) => UserDataViewModel(ref.read(userRepositoryProvider)));

final searchUserDataProvider = StateNotifierProvider.autoDispose<
        SearchUserDataViewModel, AsyncValue<UserData>>(
    (ref) => SearchUserDataViewModel(ref.read(friendRepositoryProvider)));

final submitTaskProvider =
    StateNotifierProvider.autoDispose<SubmitTaskViewModel, Task>((ref) =>
        SubmitTaskViewModel(
            ref.read(taskRepositoryProvider),
            ref.read(userDataProvider.notifier),
            ref.watch(taskNameControllerStateProvider),
            ref.watch(smallTaskNameController1StateProvider),
            ref.watch(smallTaskNameController2StateProvider),
            ref.watch(smallTaskNameController3StateProvider)));

final submitGohobiProvider =
    StateNotifierProvider.autoDispose<SubmitGohobiViewModel, Gohobi>(
        (ref) => SubmitGohobiViewModel(ref.read(gohobiRepositoryProvider)));

final gohobiUserDataProvider = StateNotifierProvider.autoDispose<
        GohobiUserDataViewModel, AsyncValue<List<UserData>>>(
    (ref) => GohobiUserDataViewModel(ref.read(gohobiRepositoryProvider)));

final detailTaskProvider =
    StateNotifierProvider.autoDispose<DetailTaskViewModel, AsyncValue<Task>>(
        (ref) => DetailTaskViewModel(ref.read(taskRepositoryProvider)));

final gohobiMessageProvider = StateNotifierProvider.autoDispose<
        GohobiMessageViewModel, AsyncValue<List<String>>>(
    (ref) => GohobiMessageViewModel(ref.read(gohobiRepositoryProvider)));

// TextEditingControllers

final taskNameControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final smallTaskNameController1StateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final smallTaskNameController2StateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final smallTaskNameController3StateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

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
