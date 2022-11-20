import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';
import '../repository/friend_repository.dart';

class SearchUserDataViewModel extends StateNotifier<AsyncValue<UserData>> {
  SearchUserDataViewModel(this._friendRepository) : super(const AsyncLoading());
  final FriendRepository _friendRepository;

  Future<void> searchUserData(String userId) async {
    state = const AsyncLoading();
    await _friendRepository.fetchUserData(userId).then((result) {
      result.when(
          success: ((value) => state = AsyncValue.data(value)),
          failure: (error) =>
              state = const AsyncValue.error("ユーザーが見つかりませんでした"));
    });
  }

  Future<void> addFriendUser(String myUserId, String friendUserId) async {
    await _friendRepository.addFriendUser(myUserId, friendUserId);
  }
}
