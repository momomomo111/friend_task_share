// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gohobi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Gohobi {
  String get message => throw _privateConstructorUsedError;
  String get fromUserId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GohobiCopyWith<Gohobi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GohobiCopyWith<$Res> {
  factory $GohobiCopyWith(Gohobi value, $Res Function(Gohobi) then) =
      _$GohobiCopyWithImpl<$Res>;
  $Res call({String message, String fromUserId});
}

/// @nodoc
class _$GohobiCopyWithImpl<$Res> implements $GohobiCopyWith<$Res> {
  _$GohobiCopyWithImpl(this._value, this._then);

  final Gohobi _value;
  // ignore: unused_field
  final $Res Function(Gohobi) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? fromUserId = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserId: fromUserId == freezed
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GohobiCopyWith<$Res> implements $GohobiCopyWith<$Res> {
  factory _$$_GohobiCopyWith(_$_Gohobi value, $Res Function(_$_Gohobi) then) =
      __$$_GohobiCopyWithImpl<$Res>;
  @override
  $Res call({String message, String fromUserId});
}

/// @nodoc
class __$$_GohobiCopyWithImpl<$Res> extends _$GohobiCopyWithImpl<$Res>
    implements _$$_GohobiCopyWith<$Res> {
  __$$_GohobiCopyWithImpl(_$_Gohobi _value, $Res Function(_$_Gohobi) _then)
      : super(_value, (v) => _then(v as _$_Gohobi));

  @override
  _$_Gohobi get _value => super._value as _$_Gohobi;

  @override
  $Res call({
    Object? message = freezed,
    Object? fromUserId = freezed,
  }) {
    return _then(_$_Gohobi(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserId: fromUserId == freezed
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Gohobi implements _Gohobi {
  const _$_Gohobi({required this.message, required this.fromUserId});

  @override
  final String message;
  @override
  final String fromUserId;

  @override
  String toString() {
    return 'Gohobi(message: $message, fromUserId: $fromUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gohobi &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.fromUserId, fromUserId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(fromUserId));

  @JsonKey(ignore: true)
  @override
  _$$_GohobiCopyWith<_$_Gohobi> get copyWith =>
      __$$_GohobiCopyWithImpl<_$_Gohobi>(this, _$identity);
}

abstract class _Gohobi implements Gohobi {
  const factory _Gohobi(
      {required final String message,
      required final String fromUserId}) = _$_Gohobi;

  @override
  String get message;
  @override
  String get fromUserId;
  @override
  @JsonKey(ignore: true)
  _$$_GohobiCopyWith<_$_Gohobi> get copyWith =>
      throw _privateConstructorUsedError;
}
