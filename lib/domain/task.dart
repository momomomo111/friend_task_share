import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String uid,
    required String taskName,
    required DateTime deadline,
    required List<String> smallTaskName,
    required List<String> gohobiListId,
  }) = _Task;
}
