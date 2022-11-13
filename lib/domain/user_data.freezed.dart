// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserData {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<Task> get taskList => throw _privateConstructorUsedError;
  List<String> get friendIdList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String name,
      String imageUrl,
      List<Task> taskList,
      List<String> friendIdList});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? taskList = freezed,
    Object? friendIdList = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      taskList: taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      friendIdList: friendIdList == freezed
          ? _value.friendIdList
          : friendIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String name,
      String imageUrl,
      List<Task> taskList,
      List<String> friendIdList});
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, (v) => _then(v as _$_UserData));

  @override
  _$_UserData get _value => super._value as _$_UserData;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? taskList = freezed,
    Object? friendIdList = freezed,
  }) {
    return _then(_$_UserData(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      taskList: taskList == freezed
          ? _value._taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      friendIdList: friendIdList == freezed
          ? _value._friendIdList
          : friendIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_UserData implements _UserData {
  const _$_UserData(
      {required this.uid,
      required this.name,
      required this.imageUrl,
      required final List<Task> taskList,
      required final List<String> friendIdList})
      : _taskList = taskList,
        _friendIdList = friendIdList;

  @override
  final String uid;
  @override
  final String name;
  @override
  final String imageUrl;
  final List<Task> _taskList;
  @override
  List<Task> get taskList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskList);
  }

  final List<String> _friendIdList;
  @override
  List<String> get friendIdList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendIdList);
  }

  @override
  String toString() {
    return 'UserData(uid: $uid, name: $name, imageUrl: $imageUrl, taskList: $taskList, friendIdList: $friendIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other._taskList, _taskList) &&
            const DeepCollectionEquality()
                .equals(other._friendIdList, _friendIdList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(_taskList),
      const DeepCollectionEquality().hash(_friendIdList));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final String uid,
      required final String name,
      required final String imageUrl,
      required final List<Task> taskList,
      required final List<String> friendIdList}) = _$_UserData;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  List<Task> get taskList;
  @override
  List<String> get friendIdList;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
