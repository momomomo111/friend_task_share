import 'package:freezed_annotation/freezed_annotation.dart';

part 'gohobi.freezed.dart';

@freezed
abstract class Gohobi with _$Gohobi {
  const factory Gohobi({
    required int id,
    required String message,
    required String fromUserName,
  }) = _Gohobi;
}
