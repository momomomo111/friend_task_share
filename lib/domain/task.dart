import 'package:freezed_annotation/freezed_annotation.dart';

import 'gohobi.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required int id,
    required String taskName,
    required List<String> smallTaskName,
    required List<Gohobi> gohobiList,
  }) = _Task;
}
