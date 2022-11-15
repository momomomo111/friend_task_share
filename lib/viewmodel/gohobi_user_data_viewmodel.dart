import 'package:friend_task_share/repository/gohobi_repository.dart';

import '../repository/friend_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/user_data.dart';

class GohobiUserDataViewModel
    extends StateNotifier<AsyncValue<List<UserData>>> {
  GohobiUserDataViewModel(this._gohobiRepository) : super(const AsyncLoading());
  final GohobiRepository _gohobiRepository;

  Future<void> fetchGohobiListUserList(List<String> gohobiIdList) async {
    state = const AsyncLoading();
    await _gohobiRepository
        .fetchGohobiListFromUserDataList(gohobiIdList)
        .then((result) {
      result.when(
        success: ((value) => state = AsyncValue.data(value)),
        failure: (error) => state = const AsyncValue.error("ユーザーが見つかりませんでした"),
      );
    });
  }
}
