import 'package:friend_task_share/repository/task_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';
import '../repository/user_repository.dart';

class UserDataViewModel extends StateNotifier<UserData> {
  UserDataViewModel(this._userRepository)
      : super(const UserData(
            uid: "unknown",
            name: "unknown",
            imageUrl:
                "https://pics.prcm.jp/6bc8bf1279f57/40730618/jpeg/40730618_480x480.jpeg"));
  final UserRepository _userRepository;

  void initBaseData(String uid, String name, String imageUrl) {
    state = UserData(uid: uid, name: name, imageUrl: imageUrl);
  }

  Future<void> createUserData() async {
    final uid = state.uid;
    final name = state.name;
    final imageUrl = state.imageUrl;
    await _userRepository.createUserData(uid, name, imageUrl);
  }
}
