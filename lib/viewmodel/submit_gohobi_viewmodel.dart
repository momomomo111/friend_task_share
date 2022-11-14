import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/gohobi.dart';
import '../repository/gohobi_repository.dart';

class SubmitGohobiViewModel extends StateNotifier<Gohobi> {
  SubmitGohobiViewModel(this._gohobiRepository)
      : super(const Gohobi(message: "", fromUserId: ""));

  final GohobiRepository _gohobiRepository;

  void createGohobi(String userId, String message) {
    state = state.copyWith(message: message, fromUserId: userId);
  }

  Future<void> submitGohobi(String taskId) async {
    await _gohobiRepository.addGohobi(taskId, state.fromUserId, state.message);
  }
}
