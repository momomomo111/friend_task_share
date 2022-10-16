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
  int get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get fromUserName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GohobiCopyWith<Gohobi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GohobiCopyWith<$Res> {
  factory $GohobiCopyWith(Gohobi value, $Res Function(Gohobi) then) =
      _$GohobiCopyWithImpl<$Res>;
  $Res call({int id, String message, String fromUserName});
}

/// @nodoc
class _$GohobiCopyWithImpl<$Res> implements $GohobiCopyWith<$Res> {
  _$GohobiCopyWithImpl(this._value, this._then);

  final Gohobi _value;
  // ignore: unused_field
  final $Res Function(Gohobi) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? fromUserName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserName: fromUserName == freezed
          ? _value.fromUserName
          : fromUserName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GohobiCopyWith<$Res> implements $GohobiCopyWith<$Res> {
  factory _$$_GohobiCopyWith(_$_Gohobi value, $Res Function(_$_Gohobi) then) =
      __$$_GohobiCopyWithImpl<$Res>;
  @override
  $Res call({int id, String message, String fromUserName});
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
    Object? id = freezed,
    Object? message = freezed,
    Object? fromUserName = freezed,
  }) {
    return _then(_$_Gohobi(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      fromUserName: fromUserName == freezed
          ? _value.fromUserName
          : fromUserName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Gohobi implements _Gohobi {
  const _$_Gohobi(
      {required this.id, required this.message, required this.fromUserName});

  @override
  final int id;
  @override
  final String message;
  @override
  final String fromUserName;

  @override
  String toString() {
    return 'Gohobi(id: $id, message: $message, fromUserName: $fromUserName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gohobi &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.fromUserName, fromUserName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(fromUserName));

  @JsonKey(ignore: true)
  @override
  _$$_GohobiCopyWith<_$_Gohobi> get copyWith =>
      __$$_GohobiCopyWithImpl<_$_Gohobi>(this, _$identity);
}

abstract class _Gohobi implements Gohobi {
  const factory _Gohobi(
      {required final int id,
      required final String message,
      required final String fromUserName}) = _$_Gohobi;

  @override
  int get id;
  @override
  String get message;
  @override
  String get fromUserName;
  @override
  @JsonKey(ignore: true)
  _$$_GohobiCopyWith<_$_Gohobi> get copyWith =>
      throw _privateConstructorUsedError;
}
