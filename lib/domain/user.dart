import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'task.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User(
      {required int id,
      required String name,
      required String imageUrl,
      required List<Task> taskList,
      required List<User> friendUser}) = _User;
}
