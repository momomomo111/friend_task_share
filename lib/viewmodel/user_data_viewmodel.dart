import 'package:friend_task_share/repository/task_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';

class UserDataViewModel extends StateNotifier<AsyncValue<UserData>> {
  UserDataViewModel(this._taskRepository) : super(const AsyncValue.loading());
  final TaskRepository _taskRepository;

  void initBaseData(String uid, String name, String imageUrl) {
    state = AsyncValue.data(UserData(
        uid: uid,
        name: name,
        imageUrl: imageUrl,
        taskList: [],
        friendIdList: []));
  }

  void fetchFriendUserIdList() async {
    await _taskRepository.fetchFriendUserId(state.value!.uid).then((result) {
      result.when(success: ((value) {
        state = AsyncValue.data(state.value!.copyWith(friendIdList: value));
      }), failure: (error) {
        state = AsyncValue.error(error);
      });
    });
  }
}
