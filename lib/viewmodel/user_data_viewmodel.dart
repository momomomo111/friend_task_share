import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';

class UserDataViewModel extends StateNotifier<UserData> {
  UserDataViewModel()
      : super(const UserData(
            uid: "",
            name: "unknown",
            imageUrl: "https://hogehoge",
            taskList: [],
            friendUser: []));

  void initBaseData(String uid, String name, String imageUrl) {
    state = state.copyWith(uid: uid, name: name, imageUrl: imageUrl);
  }
}
