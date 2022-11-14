import '../repository/friend_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';

class FriendUserDataViewModel extends StateNotifier<AsyncValue<UserData>> {
  FriendUserDataViewModel(this._friendRepository) : super(const AsyncLoading());
  final FriendRepository _friendRepository;

  Future<void> searchUserData(String userId) async {
    await _friendRepository.fetchUserData(userId).then((result) {
      result.when(
          success: ((value) {
            state = value.name != "unknown"
                ? AsyncValue.data(value)
                : const AsyncValue.error("ユーザーが見つかりませんでした");
          }),
          failure: (error) => state = AsyncValue.error(error));
    });
  }

  Future<void> addFriendUser(String myUserId, String friendUserId) async {
    await _friendRepository.addFriendUser(myUserId, friendUserId);
  }
}
