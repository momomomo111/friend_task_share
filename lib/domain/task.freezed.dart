// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Task {
  String get uid => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  List<String> get smallTaskName => throw _privateConstructorUsedError;
  List<String> get gohobiListId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String taskName,
      DateTime deadline,
      List<String> smallTaskName,
      List<String> gohobiListId});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? taskName = freezed,
    Object? deadline = freezed,
    Object? smallTaskName = freezed,
    Object? gohobiListId = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: taskName == freezed
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      smallTaskName: smallTaskName == freezed
          ? _value.smallTaskName
          : smallTaskName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gohobiListId: gohobiListId == freezed
          ? _value.gohobiListId
          : gohobiListId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String taskName,
      DateTime deadline,
      List<String> smallTaskName,
      List<String> gohobiListId});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? uid = freezed,
    Object? taskName = freezed,
    Object? deadline = freezed,
    Object? smallTaskName = freezed,
    Object? gohobiListId = freezed,
  }) {
    return _then(_$_Task(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: taskName == freezed
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      smallTaskName: smallTaskName == freezed
          ? _value._smallTaskName
          : smallTaskName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gohobiListId: gohobiListId == freezed
          ? _value._gohobiListId
          : gohobiListId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Task implements _Task {
  const _$_Task(
      {required this.uid,
      required this.taskName,
      required this.deadline,
      required final List<String> smallTaskName,
      required final List<String> gohobiListId})
      : _smallTaskName = smallTaskName,
        _gohobiListId = gohobiListId;

  @override
  final String uid;
  @override
  final String taskName;
  @override
  final DateTime deadline;
  final List<String> _smallTaskName;
  @override
  List<String> get smallTaskName {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_smallTaskName);
  }

  final List<String> _gohobiListId;
  @override
  List<String> get gohobiListId {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gohobiListId);
  }

  @override
  String toString() {
    return 'Task(uid: $uid, taskName: $taskName, deadline: $deadline, smallTaskName: $smallTaskName, gohobiListId: $gohobiListId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.taskName, taskName) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality()
                .equals(other._smallTaskName, _smallTaskName) &&
            const DeepCollectionEquality()
                .equals(other._gohobiListId, _gohobiListId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(taskName),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(_smallTaskName),
      const DeepCollectionEquality().hash(_gohobiListId));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String uid,
      required final String taskName,
      required final DateTime deadline,
      required final List<String> smallTaskName,
      required final List<String> gohobiListId}) = _$_Task;

  @override
  String get uid;
  @override
  String get taskName;
  @override
  DateTime get deadline;
  @override
  List<String> get smallTaskName;
  @override
  List<String> get gohobiListId;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
