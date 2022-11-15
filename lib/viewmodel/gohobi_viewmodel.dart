import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/gohobi_repository.dart';

class GohobiMessageViewModel extends StateNotifier<AsyncValue<List<String>>> {
  GohobiMessageViewModel(this._gohobiRepository)
      : super(const AsyncValue.loading());
  final GohobiRepository _gohobiRepository;

  Future<void> fetchGohobiListMessageList(List<String> gohobiIdList) async {
    state = const AsyncValue.loading();
    state = await _gohobiRepository
        .fetchGohobiListMessageList(gohobiIdList)
        .then((result) {
      return result.when(
        success: ((value) => state = AsyncValue.data(value)),
        failure: (error) => state = const AsyncValue.error("ユーザーが見つかりませんでした"),
      );
    });
  }
}
