// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hoyolab_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HoyolabApiResult<T> _$HoyolabApiResultFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _HoyolabApiResult<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$HoyolabApiResult<T> {
  int get retcode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoyolabApiResultCopyWith<T, HoyolabApiResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoyolabApiResultCopyWith<T, $Res> {
  factory $HoyolabApiResultCopyWith(
          HoyolabApiResult<T> value, $Res Function(HoyolabApiResult<T>) then) =
      _$HoyolabApiResultCopyWithImpl<T, $Res, HoyolabApiResult<T>>;
  @useResult
  $Res call({int retcode, String message, T? data});
}

/// @nodoc
class _$HoyolabApiResultCopyWithImpl<T, $Res, $Val extends HoyolabApiResult<T>>
    implements $HoyolabApiResultCopyWith<T, $Res> {
  _$HoyolabApiResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retcode = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      retcode: null == retcode
          ? _value.retcode
          : retcode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HoyolabApiResultImplCopyWith<T, $Res>
    implements $HoyolabApiResultCopyWith<T, $Res> {
  factory _$$HoyolabApiResultImplCopyWith(_$HoyolabApiResultImpl<T> value,
          $Res Function(_$HoyolabApiResultImpl<T>) then) =
      __$$HoyolabApiResultImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int retcode, String message, T? data});
}

/// @nodoc
class __$$HoyolabApiResultImplCopyWithImpl<T, $Res>
    extends _$HoyolabApiResultCopyWithImpl<T, $Res, _$HoyolabApiResultImpl<T>>
    implements _$$HoyolabApiResultImplCopyWith<T, $Res> {
  __$$HoyolabApiResultImplCopyWithImpl(_$HoyolabApiResultImpl<T> _value,
      $Res Function(_$HoyolabApiResultImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retcode = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$HoyolabApiResultImpl<T>(
      retcode: null == retcode
          ? _value.retcode
          : retcode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$HoyolabApiResultImpl<T> extends _HoyolabApiResult<T> {
  const _$HoyolabApiResultImpl(
      {required this.retcode, required this.message, this.data})
      : super._();

  factory _$HoyolabApiResultImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$HoyolabApiResultImplFromJson(json, fromJsonT);

  @override
  final int retcode;
  @override
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'HoyolabApiResult<$T>(retcode: $retcode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoyolabApiResultImpl<T> &&
            (identical(other.retcode, retcode) || other.retcode == retcode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, retcode, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoyolabApiResultImplCopyWith<T, _$HoyolabApiResultImpl<T>> get copyWith =>
      __$$HoyolabApiResultImplCopyWithImpl<T, _$HoyolabApiResultImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$HoyolabApiResultImplToJson<T>(this, toJsonT);
  }
}

abstract class _HoyolabApiResult<T> extends HoyolabApiResult<T> {
  const factory _HoyolabApiResult(
      {required final int retcode,
      required final String message,
      final T? data}) = _$HoyolabApiResultImpl<T>;
  const _HoyolabApiResult._() : super._();

  factory _HoyolabApiResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$HoyolabApiResultImpl<T>.fromJson;

  @override
  int get retcode;
  @override
  String get message;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$HoyolabApiResultImplCopyWith<T, _$HoyolabApiResultImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

HoyolabListData<T> _$HoyolabListDataFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _HoyolabListData<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$HoyolabListData<T> {
  List<T> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoyolabListDataCopyWith<T, HoyolabListData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoyolabListDataCopyWith<T, $Res> {
  factory $HoyolabListDataCopyWith(
          HoyolabListData<T> value, $Res Function(HoyolabListData<T>) then) =
      _$HoyolabListDataCopyWithImpl<T, $Res, HoyolabListData<T>>;
  @useResult
  $Res call({List<T> list});
}

/// @nodoc
class _$HoyolabListDataCopyWithImpl<T, $Res, $Val extends HoyolabListData<T>>
    implements $HoyolabListDataCopyWith<T, $Res> {
  _$HoyolabListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HoyolabListDataImplCopyWith<T, $Res>
    implements $HoyolabListDataCopyWith<T, $Res> {
  factory _$$HoyolabListDataImplCopyWith(_$HoyolabListDataImpl<T> value,
          $Res Function(_$HoyolabListDataImpl<T>) then) =
      __$$HoyolabListDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> list});
}

/// @nodoc
class __$$HoyolabListDataImplCopyWithImpl<T, $Res>
    extends _$HoyolabListDataCopyWithImpl<T, $Res, _$HoyolabListDataImpl<T>>
    implements _$$HoyolabListDataImplCopyWith<T, $Res> {
  __$$HoyolabListDataImplCopyWithImpl(_$HoyolabListDataImpl<T> _value,
      $Res Function(_$HoyolabListDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$HoyolabListDataImpl<T>(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$HoyolabListDataImpl<T> implements _HoyolabListData<T> {
  const _$HoyolabListDataImpl({required final List<T> list}) : _list = list;

  factory _$HoyolabListDataImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$HoyolabListDataImplFromJson(json, fromJsonT);

  final List<T> _list;
  @override
  List<T> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'HoyolabListData<$T>(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoyolabListDataImpl<T> &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoyolabListDataImplCopyWith<T, _$HoyolabListDataImpl<T>> get copyWith =>
      __$$HoyolabListDataImplCopyWithImpl<T, _$HoyolabListDataImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$HoyolabListDataImplToJson<T>(this, toJsonT);
  }
}

abstract class _HoyolabListData<T> implements HoyolabListData<T> {
  const factory _HoyolabListData({required final List<T> list}) =
      _$HoyolabListDataImpl<T>;

  factory _HoyolabListData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$HoyolabListDataImpl<T>.fromJson;

  @override
  List<T> get list;
  @override
  @JsonKey(ignore: true)
  _$$HoyolabListDataImplCopyWith<T, _$HoyolabListDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

HyvServer _$HyvServerFromJson(Map<String, dynamic> json) {
  return _HyvServer.fromJson(json);
}

/// @nodoc
mixin _$HyvServer {
  String get region => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HyvServerCopyWith<HyvServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HyvServerCopyWith<$Res> {
  factory $HyvServerCopyWith(HyvServer value, $Res Function(HyvServer) then) =
      _$HyvServerCopyWithImpl<$Res, HyvServer>;
  @useResult
  $Res call({String region, String name});
}

/// @nodoc
class _$HyvServerCopyWithImpl<$Res, $Val extends HyvServer>
    implements $HyvServerCopyWith<$Res> {
  _$HyvServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HyvServerImplCopyWith<$Res>
    implements $HyvServerCopyWith<$Res> {
  factory _$$HyvServerImplCopyWith(
          _$HyvServerImpl value, $Res Function(_$HyvServerImpl) then) =
      __$$HyvServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String region, String name});
}

/// @nodoc
class __$$HyvServerImplCopyWithImpl<$Res>
    extends _$HyvServerCopyWithImpl<$Res, _$HyvServerImpl>
    implements _$$HyvServerImplCopyWith<$Res> {
  __$$HyvServerImplCopyWithImpl(
      _$HyvServerImpl _value, $Res Function(_$HyvServerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
    Object? name = null,
  }) {
    return _then(_$HyvServerImpl(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HyvServerImpl implements _HyvServer {
  const _$HyvServerImpl({required this.region, required this.name});

  factory _$HyvServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$HyvServerImplFromJson(json);

  @override
  final String region;
  @override
  final String name;

  @override
  String toString() {
    return 'HyvServer(region: $region, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HyvServerImpl &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, region, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HyvServerImplCopyWith<_$HyvServerImpl> get copyWith =>
      __$$HyvServerImplCopyWithImpl<_$HyvServerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HyvServerImplToJson(
      this,
    );
  }
}

abstract class _HyvServer implements HyvServer {
  const factory _HyvServer(
      {required final String region,
      required final String name}) = _$HyvServerImpl;

  factory _HyvServer.fromJson(Map<String, dynamic> json) =
      _$HyvServerImpl.fromJson;

  @override
  String get region;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$HyvServerImplCopyWith<_$HyvServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HyvUserInfo _$HyvUserInfoFromJson(Map<String, dynamic> json) {
  return _HyvUserInfo.fromJson(json);
}

/// @nodoc
mixin _$HyvUserInfo {
// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "account_name")
  String get accountName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HyvUserInfoCopyWith<HyvUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HyvUserInfoCopyWith<$Res> {
  factory $HyvUserInfoCopyWith(
          HyvUserInfo value, $Res Function(HyvUserInfo) then) =
      _$HyvUserInfoCopyWithImpl<$Res, HyvUserInfo>;
  @useResult
  $Res call({@JsonKey(name: "account_name") String accountName});
}

/// @nodoc
class _$HyvUserInfoCopyWithImpl<$Res, $Val extends HyvUserInfo>
    implements $HyvUserInfoCopyWith<$Res> {
  _$HyvUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
  }) {
    return _then(_value.copyWith(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HyvUserInfoImplCopyWith<$Res>
    implements $HyvUserInfoCopyWith<$Res> {
  factory _$$HyvUserInfoImplCopyWith(
          _$HyvUserInfoImpl value, $Res Function(_$HyvUserInfoImpl) then) =
      __$$HyvUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "account_name") String accountName});
}

/// @nodoc
class __$$HyvUserInfoImplCopyWithImpl<$Res>
    extends _$HyvUserInfoCopyWithImpl<$Res, _$HyvUserInfoImpl>
    implements _$$HyvUserInfoImplCopyWith<$Res> {
  __$$HyvUserInfoImplCopyWithImpl(
      _$HyvUserInfoImpl _value, $Res Function(_$HyvUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
  }) {
    return _then(_$HyvUserInfoImpl(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HyvUserInfoImpl implements _HyvUserInfo {
  const _$HyvUserInfoImpl(
      {@JsonKey(name: "account_name") required this.accountName});

  factory _$HyvUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HyvUserInfoImplFromJson(json);

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "account_name")
  final String accountName;

  @override
  String toString() {
    return 'HyvUserInfo(accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HyvUserInfoImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HyvUserInfoImplCopyWith<_$HyvUserInfoImpl> get copyWith =>
      __$$HyvUserInfoImplCopyWithImpl<_$HyvUserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HyvUserInfoImplToJson(
      this,
    );
  }
}

abstract class _HyvUserInfo implements HyvUserInfo {
  const factory _HyvUserInfo(
          {@JsonKey(name: "account_name") required final String accountName}) =
      _$HyvUserInfoImpl;

  factory _HyvUserInfo.fromJson(Map<String, dynamic> json) =
      _$HyvUserInfoImpl.fromJson;

  @override // workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "account_name")
  String get accountName;
  @override
  @JsonKey(ignore: true)
  _$$HyvUserInfoImplCopyWith<_$HyvUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HyvUserGameRole _$HyvUserGameRoleFromJson(Map<String, dynamic> json) {
  return _HyvUserGameRole.fromJson(json);
}

/// @nodoc
mixin _$HyvUserGameRole {
// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "game_uid")
  String get uid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HyvUserGameRoleCopyWith<HyvUserGameRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HyvUserGameRoleCopyWith<$Res> {
  factory $HyvUserGameRoleCopyWith(
          HyvUserGameRole value, $Res Function(HyvUserGameRole) then) =
      _$HyvUserGameRoleCopyWithImpl<$Res, HyvUserGameRole>;
  @useResult
  $Res call(
      {@JsonKey(name: "game_uid") String uid, String nickname, int level});
}

/// @nodoc
class _$HyvUserGameRoleCopyWithImpl<$Res, $Val extends HyvUserGameRole>
    implements $HyvUserGameRoleCopyWith<$Res> {
  _$HyvUserGameRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? nickname = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HyvUserGameRoleImplCopyWith<$Res>
    implements $HyvUserGameRoleCopyWith<$Res> {
  factory _$$HyvUserGameRoleImplCopyWith(_$HyvUserGameRoleImpl value,
          $Res Function(_$HyvUserGameRoleImpl) then) =
      __$$HyvUserGameRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "game_uid") String uid, String nickname, int level});
}

/// @nodoc
class __$$HyvUserGameRoleImplCopyWithImpl<$Res>
    extends _$HyvUserGameRoleCopyWithImpl<$Res, _$HyvUserGameRoleImpl>
    implements _$$HyvUserGameRoleImplCopyWith<$Res> {
  __$$HyvUserGameRoleImplCopyWithImpl(
      _$HyvUserGameRoleImpl _value, $Res Function(_$HyvUserGameRoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? nickname = null,
    Object? level = null,
  }) {
    return _then(_$HyvUserGameRoleImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HyvUserGameRoleImpl implements _HyvUserGameRole {
  const _$HyvUserGameRoleImpl(
      {@JsonKey(name: "game_uid") required this.uid,
      required this.nickname,
      required this.level});

  factory _$HyvUserGameRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HyvUserGameRoleImplFromJson(json);

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_uid")
  final String uid;
  @override
  final String nickname;
  @override
  final int level;

  @override
  String toString() {
    return 'HyvUserGameRole(uid: $uid, nickname: $nickname, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HyvUserGameRoleImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nickname, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HyvUserGameRoleImplCopyWith<_$HyvUserGameRoleImpl> get copyWith =>
      __$$HyvUserGameRoleImplCopyWithImpl<_$HyvUserGameRoleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HyvUserGameRoleImplToJson(
      this,
    );
  }
}

abstract class _HyvUserGameRole implements HyvUserGameRole {
  const factory _HyvUserGameRole(
      {@JsonKey(name: "game_uid") required final String uid,
      required final String nickname,
      required final int level}) = _$HyvUserGameRoleImpl;

  factory _HyvUserGameRole.fromJson(Map<String, dynamic> json) =
      _$HyvUserGameRoleImpl.fromJson;

  @override // workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "game_uid")
  String get uid;
  @override
  String get nickname;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$HyvUserGameRoleImplCopyWith<_$HyvUserGameRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
