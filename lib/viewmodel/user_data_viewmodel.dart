import 'package:friend_task_share/repository/friendtask_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';

class UserDataViewModel extends StateNotifier<AsyncValue<UserData>> {
  UserDataViewModel(this._friendTaskRepository)
      : super(const AsyncValue.loading());
  final FriendTaskRepository _friendTaskRepository;

  void initBaseData(String uid, String name, String imageUrl) {
    state = AsyncValue.data(UserData(
        uid: uid,
        name: name,
        imageUrl: imageUrl,
        taskList: [],
        friendUser: []));
  }

  void fetchFriendUser() async {
    List<String> friendUserIdList = [];
    await _friendTaskRepository
        .fetchFriendUserId(state.value!.uid)
        .then((result) {
      result.when(
          success: ((value) => friendUserIdList = value),
          failure: (error) {
            state = AsyncValue.error(error);
          });
    });
    print(friendUserIdList);
  }
}
