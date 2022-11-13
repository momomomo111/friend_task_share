import 'package:freezed_annotation/freezed_annotation.dart';

import 'task.dart';

part 'user_data.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData(
      {required String uid,
      required String name,
      required String imageUrl}) = _UserData;
}
