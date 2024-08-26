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

  /// Serializes this HoyolabApiResult to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HoyolabApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HoyolabApiResult
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of HoyolabApiResult
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, retcode, message, const DeepCollectionEquality().hash(data));

  /// Create a copy of HoyolabApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HoyolabApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this HoyolabListData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HoyolabListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HoyolabListData
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of HoyolabListData
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of HoyolabListData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HoyolabListData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this HyvServer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HyvServer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HyvServer
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of HyvServer
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, region, name);

  /// Create a copy of HyvServer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HyvServer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this HyvUserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HyvUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HyvUserInfo
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of HyvUserInfo
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  /// Create a copy of HyvUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "account_name")
  String get accountName;

  /// Create a copy of HyvUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this HyvUserGameRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HyvUserGameRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HyvUserGameRole
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of HyvUserGameRole
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nickname, level);

  /// Create a copy of HyvUserGameRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_uid")
  String get uid;
  @override
  String get nickname;
  @override
  int get level;

  /// Create a copy of HyvUserGameRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HyvUserGameRoleImplCopyWith<_$HyvUserGameRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvatarListResultItem _$AvatarListResultItemFromJson(Map<String, dynamic> json) {
  return _AvatarListResultItem.fromJson(json);
}

/// @nodoc
mixin _$AvatarListResultItem {
  int get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @JsonKey(name: "level_current")
  String get currentLevel =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "max_level")
  int get maxLevel => throw _privateConstructorUsedError;

  /// Serializes this AvatarListResultItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvatarListResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarListResultItemCopyWith<AvatarListResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarListResultItemCopyWith<$Res> {
  factory $AvatarListResultItemCopyWith(AvatarListResultItem value,
          $Res Function(AvatarListResultItem) then) =
      _$AvatarListResultItemCopyWithImpl<$Res, AvatarListResultItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "level_current") String currentLevel,
      @JsonKey(name: "max_level") int maxLevel});
}

/// @nodoc
class _$AvatarListResultItemCopyWithImpl<$Res,
        $Val extends AvatarListResultItem>
    implements $AvatarListResultItemCopyWith<$Res> {
  _$AvatarListResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvatarListResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? currentLevel = null,
    Object? maxLevel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      maxLevel: null == maxLevel
          ? _value.maxLevel
          : maxLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarListResultItemImplCopyWith<$Res>
    implements $AvatarListResultItemCopyWith<$Res> {
  factory _$$AvatarListResultItemImplCopyWith(_$AvatarListResultItemImpl value,
          $Res Function(_$AvatarListResultItemImpl) then) =
      __$$AvatarListResultItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "level_current") String currentLevel,
      @JsonKey(name: "max_level") int maxLevel});
}

/// @nodoc
class __$$AvatarListResultItemImplCopyWithImpl<$Res>
    extends _$AvatarListResultItemCopyWithImpl<$Res, _$AvatarListResultItemImpl>
    implements _$$AvatarListResultItemImplCopyWith<$Res> {
  __$$AvatarListResultItemImplCopyWithImpl(_$AvatarListResultItemImpl _value,
      $Res Function(_$AvatarListResultItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvatarListResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? currentLevel = null,
    Object? maxLevel = null,
  }) {
    return _then(_$AvatarListResultItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as String,
      maxLevel: null == maxLevel
          ? _value.maxLevel
          : maxLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarListResultItemImpl extends _AvatarListResultItem {
  const _$AvatarListResultItemImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "level_current") required this.currentLevel,
      @JsonKey(name: "max_level") required this.maxLevel})
      : super._();

  factory _$AvatarListResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarListResultItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
// workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  final String currentLevel;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;

  @override
  String toString() {
    return 'AvatarListResultItem(id: $id, name: $name, currentLevel: $currentLevel, maxLevel: $maxLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarListResultItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, currentLevel, maxLevel);

  /// Create a copy of AvatarListResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarListResultItemImplCopyWith<_$AvatarListResultItemImpl>
      get copyWith =>
          __$$AvatarListResultItemImplCopyWithImpl<_$AvatarListResultItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarListResultItemImplToJson(
      this,
    );
  }
}

abstract class _AvatarListResultItem extends AvatarListResultItem {
  const factory _AvatarListResultItem(
          {required final int id,
          required final String name,
          @JsonKey(name: "level_current") required final String currentLevel,
          @JsonKey(name: "max_level") required final int maxLevel}) =
      _$AvatarListResultItemImpl;
  const _AvatarListResultItem._() : super._();

  factory _AvatarListResultItem.fromJson(Map<String, dynamic> json) =
      _$AvatarListResultItemImpl.fromJson;

  @override
  int get id;
  @override
  String
      get name; // workaround for https://github.com/rrousselGit/freezed/issues/488
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  String get currentLevel; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  int get maxLevel;

  /// Create a copy of AvatarListResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarListResultItemImplCopyWith<_$AvatarListResultItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AvatarDetail _$AvatarDetailFromJson(Map<String, dynamic> json) {
  return _AvatarDetail.fromJson(json);
}

/// @nodoc
mixin _$AvatarDetail {
// ignore: invalid_annotation_target
  @JsonKey(name: "skill_list")
  List<AvatarDetailSkill> get skills => throw _privateConstructorUsedError;

  /// Serializes this AvatarDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvatarDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarDetailCopyWith<AvatarDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarDetailCopyWith<$Res> {
  factory $AvatarDetailCopyWith(
          AvatarDetail value, $Res Function(AvatarDetail) then) =
      _$AvatarDetailCopyWithImpl<$Res, AvatarDetail>;
  @useResult
  $Res call({@JsonKey(name: "skill_list") List<AvatarDetailSkill> skills});
}

/// @nodoc
class _$AvatarDetailCopyWithImpl<$Res, $Val extends AvatarDetail>
    implements $AvatarDetailCopyWith<$Res> {
  _$AvatarDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvatarDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<AvatarDetailSkill>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarDetailImplCopyWith<$Res>
    implements $AvatarDetailCopyWith<$Res> {
  factory _$$AvatarDetailImplCopyWith(
          _$AvatarDetailImpl value, $Res Function(_$AvatarDetailImpl) then) =
      __$$AvatarDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "skill_list") List<AvatarDetailSkill> skills});
}

/// @nodoc
class __$$AvatarDetailImplCopyWithImpl<$Res>
    extends _$AvatarDetailCopyWithImpl<$Res, _$AvatarDetailImpl>
    implements _$$AvatarDetailImplCopyWith<$Res> {
  __$$AvatarDetailImplCopyWithImpl(
      _$AvatarDetailImpl _value, $Res Function(_$AvatarDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvatarDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skills = null,
  }) {
    return _then(_$AvatarDetailImpl(
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<AvatarDetailSkill>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarDetailImpl implements _AvatarDetail {
  const _$AvatarDetailImpl(
      {@JsonKey(name: "skill_list")
      required final List<AvatarDetailSkill> skills})
      : _skills = skills;

  factory _$AvatarDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarDetailImplFromJson(json);

// ignore: invalid_annotation_target
  final List<AvatarDetailSkill> _skills;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "skill_list")
  List<AvatarDetailSkill> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'AvatarDetail(skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarDetailImpl &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_skills));

  /// Create a copy of AvatarDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarDetailImplCopyWith<_$AvatarDetailImpl> get copyWith =>
      __$$AvatarDetailImplCopyWithImpl<_$AvatarDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarDetailImplToJson(
      this,
    );
  }
}

abstract class _AvatarDetail implements AvatarDetail {
  const factory _AvatarDetail(
      {@JsonKey(name: "skill_list")
      required final List<AvatarDetailSkill> skills}) = _$AvatarDetailImpl;

  factory _AvatarDetail.fromJson(Map<String, dynamic> json) =
      _$AvatarDetailImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "skill_list")
  List<AvatarDetailSkill> get skills;

  /// Create a copy of AvatarDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarDetailImplCopyWith<_$AvatarDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvatarDetailSkill _$AvatarDetailSkillFromJson(Map<String, dynamic> json) {
  return _AvatarDetailSkill.fromJson(json);
}

/// @nodoc
mixin _$AvatarDetailSkill {
// ignore: invalid_annotation_target
  @JsonKey(name: "max_level")
  int get maxLevel =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "level_current")
  int get currentLevel => throw _privateConstructorUsedError;

  /// Serializes this AvatarDetailSkill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvatarDetailSkill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarDetailSkillCopyWith<AvatarDetailSkill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarDetailSkillCopyWith<$Res> {
  factory $AvatarDetailSkillCopyWith(
          AvatarDetailSkill value, $Res Function(AvatarDetailSkill) then) =
      _$AvatarDetailSkillCopyWithImpl<$Res, AvatarDetailSkill>;
  @useResult
  $Res call(
      {@JsonKey(name: "max_level") int maxLevel,
      @JsonKey(name: "level_current") int currentLevel});
}

/// @nodoc
class _$AvatarDetailSkillCopyWithImpl<$Res, $Val extends AvatarDetailSkill>
    implements $AvatarDetailSkillCopyWith<$Res> {
  _$AvatarDetailSkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvatarDetailSkill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxLevel = null,
    Object? currentLevel = null,
  }) {
    return _then(_value.copyWith(
      maxLevel: null == maxLevel
          ? _value.maxLevel
          : maxLevel // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarDetailSkillImplCopyWith<$Res>
    implements $AvatarDetailSkillCopyWith<$Res> {
  factory _$$AvatarDetailSkillImplCopyWith(_$AvatarDetailSkillImpl value,
          $Res Function(_$AvatarDetailSkillImpl) then) =
      __$$AvatarDetailSkillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "max_level") int maxLevel,
      @JsonKey(name: "level_current") int currentLevel});
}

/// @nodoc
class __$$AvatarDetailSkillImplCopyWithImpl<$Res>
    extends _$AvatarDetailSkillCopyWithImpl<$Res, _$AvatarDetailSkillImpl>
    implements _$$AvatarDetailSkillImplCopyWith<$Res> {
  __$$AvatarDetailSkillImplCopyWithImpl(_$AvatarDetailSkillImpl _value,
      $Res Function(_$AvatarDetailSkillImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvatarDetailSkill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxLevel = null,
    Object? currentLevel = null,
  }) {
    return _then(_$AvatarDetailSkillImpl(
      maxLevel: null == maxLevel
          ? _value.maxLevel
          : maxLevel // ignore: cast_nullable_to_non_nullable
              as int,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarDetailSkillImpl implements _AvatarDetailSkill {
  const _$AvatarDetailSkillImpl(
      {@JsonKey(name: "max_level") required this.maxLevel,
      @JsonKey(name: "level_current") required this.currentLevel});

  factory _$AvatarDetailSkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarDetailSkillImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  final int maxLevel;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  final int currentLevel;

  @override
  String toString() {
    return 'AvatarDetailSkill(maxLevel: $maxLevel, currentLevel: $currentLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarDetailSkillImpl &&
            (identical(other.maxLevel, maxLevel) ||
                other.maxLevel == maxLevel) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, maxLevel, currentLevel);

  /// Create a copy of AvatarDetailSkill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarDetailSkillImplCopyWith<_$AvatarDetailSkillImpl> get copyWith =>
      __$$AvatarDetailSkillImplCopyWithImpl<_$AvatarDetailSkillImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarDetailSkillImplToJson(
      this,
    );
  }
}

abstract class _AvatarDetailSkill implements AvatarDetailSkill {
  const factory _AvatarDetailSkill(
          {@JsonKey(name: "max_level") required final int maxLevel,
          @JsonKey(name: "level_current") required final int currentLevel}) =
      _$AvatarDetailSkillImpl;

  factory _AvatarDetailSkill.fromJson(Map<String, dynamic> json) =
      _$AvatarDetailSkillImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "max_level")
  int get maxLevel; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "level_current")
  int get currentLevel;

  /// Create a copy of AvatarDetailSkill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarDetailSkillImplCopyWith<_$AvatarDetailSkillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvatarAuth _$AvatarAuthFromJson(Map<String, dynamic> json) {
  return _AvatarAuth.fromJson(json);
}

/// @nodoc
mixin _$AvatarAuth {
// ignore: invalid_annotation_target
  @JsonKey(name: "avatar_auth")
  int get avatarAuth => throw _privateConstructorUsedError;

  /// Serializes this AvatarAuth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvatarAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarAuthCopyWith<AvatarAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarAuthCopyWith<$Res> {
  factory $AvatarAuthCopyWith(
          AvatarAuth value, $Res Function(AvatarAuth) then) =
      _$AvatarAuthCopyWithImpl<$Res, AvatarAuth>;
  @useResult
  $Res call({@JsonKey(name: "avatar_auth") int avatarAuth});
}

/// @nodoc
class _$AvatarAuthCopyWithImpl<$Res, $Val extends AvatarAuth>
    implements $AvatarAuthCopyWith<$Res> {
  _$AvatarAuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvatarAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarAuth = null,
  }) {
    return _then(_value.copyWith(
      avatarAuth: null == avatarAuth
          ? _value.avatarAuth
          : avatarAuth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarAuthImplCopyWith<$Res>
    implements $AvatarAuthCopyWith<$Res> {
  factory _$$AvatarAuthImplCopyWith(
          _$AvatarAuthImpl value, $Res Function(_$AvatarAuthImpl) then) =
      __$$AvatarAuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "avatar_auth") int avatarAuth});
}

/// @nodoc
class __$$AvatarAuthImplCopyWithImpl<$Res>
    extends _$AvatarAuthCopyWithImpl<$Res, _$AvatarAuthImpl>
    implements _$$AvatarAuthImplCopyWith<$Res> {
  __$$AvatarAuthImplCopyWithImpl(
      _$AvatarAuthImpl _value, $Res Function(_$AvatarAuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AvatarAuth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarAuth = null,
  }) {
    return _then(_$AvatarAuthImpl(
      avatarAuth: null == avatarAuth
          ? _value.avatarAuth
          : avatarAuth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarAuthImpl implements _AvatarAuth {
  const _$AvatarAuthImpl(
      {@JsonKey(name: "avatar_auth") required this.avatarAuth});

  factory _$AvatarAuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarAuthImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "avatar_auth")
  final int avatarAuth;

  @override
  String toString() {
    return 'AvatarAuth(avatarAuth: $avatarAuth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarAuthImpl &&
            (identical(other.avatarAuth, avatarAuth) ||
                other.avatarAuth == avatarAuth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarAuth);

  /// Create a copy of AvatarAuth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarAuthImplCopyWith<_$AvatarAuthImpl> get copyWith =>
      __$$AvatarAuthImplCopyWithImpl<_$AvatarAuthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarAuthImplToJson(
      this,
    );
  }
}

abstract class _AvatarAuth implements AvatarAuth {
  const factory _AvatarAuth(
          {@JsonKey(name: "avatar_auth") required final int avatarAuth}) =
      _$AvatarAuthImpl;

  factory _AvatarAuth.fromJson(Map<String, dynamic> json) =
      _$AvatarAuthImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "avatar_auth")
  int get avatarAuth;

  /// Create a copy of AvatarAuth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarAuthImplCopyWith<_$AvatarAuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameRecordCard _$GameRecordCardFromJson(Map<String, dynamic> json) {
  return _GameRecordCard.fromJson(json);
}

/// @nodoc
mixin _$GameRecordCard {
// ignore: invalid_annotation_target
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches =>
      throw _privateConstructorUsedError;

  /// Serializes this GameRecordCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameRecordCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameRecordCardCopyWith<GameRecordCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameRecordCardCopyWith<$Res> {
  factory $GameRecordCardCopyWith(
          GameRecordCard value, $Res Function(GameRecordCard) then) =
      _$GameRecordCardCopyWithImpl<$Res, GameRecordCard>;
  @useResult
  $Res call(
      {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
      GameType gameType,
      @JsonKey(name: "data_switches") List<DataSwitchMetadata> dataSwitches});
}

/// @nodoc
class _$GameRecordCardCopyWithImpl<$Res, $Val extends GameRecordCard>
    implements $GameRecordCardCopyWith<$Res> {
  _$GameRecordCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameRecordCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameType = null,
    Object? dataSwitches = null,
  }) {
    return _then(_value.copyWith(
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as GameType,
      dataSwitches: null == dataSwitches
          ? _value.dataSwitches
          : dataSwitches // ignore: cast_nullable_to_non_nullable
              as List<DataSwitchMetadata>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameRecordCardImplCopyWith<$Res>
    implements $GameRecordCardCopyWith<$Res> {
  factory _$$GameRecordCardImplCopyWith(_$GameRecordCardImpl value,
          $Res Function(_$GameRecordCardImpl) then) =
      __$$GameRecordCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
      GameType gameType,
      @JsonKey(name: "data_switches") List<DataSwitchMetadata> dataSwitches});
}

/// @nodoc
class __$$GameRecordCardImplCopyWithImpl<$Res>
    extends _$GameRecordCardCopyWithImpl<$Res, _$GameRecordCardImpl>
    implements _$$GameRecordCardImplCopyWith<$Res> {
  __$$GameRecordCardImplCopyWithImpl(
      _$GameRecordCardImpl _value, $Res Function(_$GameRecordCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameRecordCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameType = null,
    Object? dataSwitches = null,
  }) {
    return _then(_$GameRecordCardImpl(
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as GameType,
      dataSwitches: null == dataSwitches
          ? _value._dataSwitches
          : dataSwitches // ignore: cast_nullable_to_non_nullable
              as List<DataSwitchMetadata>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameRecordCardImpl implements _GameRecordCard {
  const _$GameRecordCardImpl(
      {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
      required this.gameType,
      @JsonKey(name: "data_switches")
      required final List<DataSwitchMetadata> dataSwitches})
      : _dataSwitches = dataSwitches;

  factory _$GameRecordCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameRecordCardImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  final GameType gameType;
// ignore: invalid_annotation_target
  final List<DataSwitchMetadata> _dataSwitches;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches {
    if (_dataSwitches is EqualUnmodifiableListView) return _dataSwitches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataSwitches);
  }

  @override
  String toString() {
    return 'GameRecordCard(gameType: $gameType, dataSwitches: $dataSwitches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameRecordCardImpl &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            const DeepCollectionEquality()
                .equals(other._dataSwitches, _dataSwitches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameType,
      const DeepCollectionEquality().hash(_dataSwitches));

  /// Create a copy of GameRecordCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameRecordCardImplCopyWith<_$GameRecordCardImpl> get copyWith =>
      __$$GameRecordCardImplCopyWithImpl<_$GameRecordCardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameRecordCardImplToJson(
      this,
    );
  }
}

abstract class _GameRecordCard implements GameRecordCard {
  const factory _GameRecordCard(
          {@JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
          required final GameType gameType,
          @JsonKey(name: "data_switches")
          required final List<DataSwitchMetadata> dataSwitches}) =
      _$GameRecordCardImpl;

  factory _GameRecordCard.fromJson(Map<String, dynamic> json) =
      _$GameRecordCardImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "game_id", unknownEnumValue: GameType.starrail)
  GameType get gameType; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "data_switches")
  List<DataSwitchMetadata> get dataSwitches;

  /// Create a copy of GameRecordCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameRecordCardImplCopyWith<_$GameRecordCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataSwitchMetadata _$DataSwitchMetadataFromJson(Map<String, dynamic> json) {
  return _DataSwitchMetadata.fromJson(json);
}

/// @nodoc
mixin _$DataSwitchMetadata {
// ignore: invalid_annotation_target
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "is_public")
  bool get isPublic => throw _privateConstructorUsedError;

  /// Serializes this DataSwitchMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataSwitchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataSwitchMetadataCopyWith<DataSwitchMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSwitchMetadataCopyWith<$Res> {
  factory $DataSwitchMetadataCopyWith(
          DataSwitchMetadata value, $Res Function(DataSwitchMetadata) then) =
      _$DataSwitchMetadataCopyWithImpl<$Res, DataSwitchMetadata>;
  @useResult
  $Res call(
      {@JsonKey(
          name: "switch_id",
          unknownEnumValue: DataSwitchType.enableBattleChronicle)
      DataSwitchType switchId,
      @JsonKey(name: "is_public") bool isPublic});
}

/// @nodoc
class _$DataSwitchMetadataCopyWithImpl<$Res, $Val extends DataSwitchMetadata>
    implements $DataSwitchMetadataCopyWith<$Res> {
  _$DataSwitchMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataSwitchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? switchId = null,
    Object? isPublic = null,
  }) {
    return _then(_value.copyWith(
      switchId: null == switchId
          ? _value.switchId
          : switchId // ignore: cast_nullable_to_non_nullable
              as DataSwitchType,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataSwitchMetadataImplCopyWith<$Res>
    implements $DataSwitchMetadataCopyWith<$Res> {
  factory _$$DataSwitchMetadataImplCopyWith(_$DataSwitchMetadataImpl value,
          $Res Function(_$DataSwitchMetadataImpl) then) =
      __$$DataSwitchMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: "switch_id",
          unknownEnumValue: DataSwitchType.enableBattleChronicle)
      DataSwitchType switchId,
      @JsonKey(name: "is_public") bool isPublic});
}

/// @nodoc
class __$$DataSwitchMetadataImplCopyWithImpl<$Res>
    extends _$DataSwitchMetadataCopyWithImpl<$Res, _$DataSwitchMetadataImpl>
    implements _$$DataSwitchMetadataImplCopyWith<$Res> {
  __$$DataSwitchMetadataImplCopyWithImpl(_$DataSwitchMetadataImpl _value,
      $Res Function(_$DataSwitchMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSwitchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? switchId = null,
    Object? isPublic = null,
  }) {
    return _then(_$DataSwitchMetadataImpl(
      switchId: null == switchId
          ? _value.switchId
          : switchId // ignore: cast_nullable_to_non_nullable
              as DataSwitchType,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataSwitchMetadataImpl implements _DataSwitchMetadata {
  const _$DataSwitchMetadataImpl(
      {@JsonKey(
          name: "switch_id",
          unknownEnumValue: DataSwitchType.enableBattleChronicle)
      required this.switchId,
      @JsonKey(name: "is_public") required this.isPublic});

  factory _$DataSwitchMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSwitchMetadataImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  final DataSwitchType switchId;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "is_public")
  final bool isPublic;

  @override
  String toString() {
    return 'DataSwitchMetadata(switchId: $switchId, isPublic: $isPublic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSwitchMetadataImpl &&
            (identical(other.switchId, switchId) ||
                other.switchId == switchId) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, switchId, isPublic);

  /// Create a copy of DataSwitchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSwitchMetadataImplCopyWith<_$DataSwitchMetadataImpl> get copyWith =>
      __$$DataSwitchMetadataImplCopyWithImpl<_$DataSwitchMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSwitchMetadataImplToJson(
      this,
    );
  }
}

abstract class _DataSwitchMetadata implements DataSwitchMetadata {
  const factory _DataSwitchMetadata(
          {@JsonKey(
              name: "switch_id",
              unknownEnumValue: DataSwitchType.enableBattleChronicle)
          required final DataSwitchType switchId,
          @JsonKey(name: "is_public") required final bool isPublic}) =
      _$DataSwitchMetadataImpl;

  factory _DataSwitchMetadata.fromJson(Map<String, dynamic> json) =
      _$DataSwitchMetadataImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(
      name: "switch_id", unknownEnumValue: DataSwitchType.enableBattleChronicle)
  DataSwitchType get switchId; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "is_public")
  bool get isPublic;

  /// Create a copy of DataSwitchMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataSwitchMetadataImplCopyWith<_$DataSwitchMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyNote _$DailyNoteFromJson(Map<String, dynamic> json) {
  return _DailyNote.fromJson(json);
}

/// @nodoc
mixin _$DailyNote {
// ignore: invalid_annotation_target
  @JsonKey(name: "current_resin")
  int get currentResin =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "current_home_coin")
  int get currentHomeCoin => throw _privateConstructorUsedError;

  /// Serializes this DailyNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyNoteCopyWith<DailyNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyNoteCopyWith<$Res> {
  factory $DailyNoteCopyWith(DailyNote value, $Res Function(DailyNote) then) =
      _$DailyNoteCopyWithImpl<$Res, DailyNote>;
  @useResult
  $Res call(
      {@JsonKey(name: "current_resin") int currentResin,
      @JsonKey(name: "resin_recovery_time") String resinRecoveryTime,
      @JsonKey(name: "current_home_coin") int currentHomeCoin});
}

/// @nodoc
class _$DailyNoteCopyWithImpl<$Res, $Val extends DailyNote>
    implements $DailyNoteCopyWith<$Res> {
  _$DailyNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentResin = null,
    Object? resinRecoveryTime = null,
    Object? currentHomeCoin = null,
  }) {
    return _then(_value.copyWith(
      currentResin: null == currentResin
          ? _value.currentResin
          : currentResin // ignore: cast_nullable_to_non_nullable
              as int,
      resinRecoveryTime: null == resinRecoveryTime
          ? _value.resinRecoveryTime
          : resinRecoveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      currentHomeCoin: null == currentHomeCoin
          ? _value.currentHomeCoin
          : currentHomeCoin // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyNoteImplCopyWith<$Res>
    implements $DailyNoteCopyWith<$Res> {
  factory _$$DailyNoteImplCopyWith(
          _$DailyNoteImpl value, $Res Function(_$DailyNoteImpl) then) =
      __$$DailyNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "current_resin") int currentResin,
      @JsonKey(name: "resin_recovery_time") String resinRecoveryTime,
      @JsonKey(name: "current_home_coin") int currentHomeCoin});
}

/// @nodoc
class __$$DailyNoteImplCopyWithImpl<$Res>
    extends _$DailyNoteCopyWithImpl<$Res, _$DailyNoteImpl>
    implements _$$DailyNoteImplCopyWith<$Res> {
  __$$DailyNoteImplCopyWithImpl(
      _$DailyNoteImpl _value, $Res Function(_$DailyNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentResin = null,
    Object? resinRecoveryTime = null,
    Object? currentHomeCoin = null,
  }) {
    return _then(_$DailyNoteImpl(
      currentResin: null == currentResin
          ? _value.currentResin
          : currentResin // ignore: cast_nullable_to_non_nullable
              as int,
      resinRecoveryTime: null == resinRecoveryTime
          ? _value.resinRecoveryTime
          : resinRecoveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      currentHomeCoin: null == currentHomeCoin
          ? _value.currentHomeCoin
          : currentHomeCoin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyNoteImpl implements _DailyNote {
  const _$DailyNoteImpl(
      {@JsonKey(name: "current_resin") required this.currentResin,
      @JsonKey(name: "resin_recovery_time") required this.resinRecoveryTime,
      @JsonKey(name: "current_home_coin") required this.currentHomeCoin});

  factory _$DailyNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyNoteImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_resin")
  final int currentResin;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "resin_recovery_time")
  final String resinRecoveryTime;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_home_coin")
  final int currentHomeCoin;

  @override
  String toString() {
    return 'DailyNote(currentResin: $currentResin, resinRecoveryTime: $resinRecoveryTime, currentHomeCoin: $currentHomeCoin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyNoteImpl &&
            (identical(other.currentResin, currentResin) ||
                other.currentResin == currentResin) &&
            (identical(other.resinRecoveryTime, resinRecoveryTime) ||
                other.resinRecoveryTime == resinRecoveryTime) &&
            (identical(other.currentHomeCoin, currentHomeCoin) ||
                other.currentHomeCoin == currentHomeCoin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentResin, resinRecoveryTime, currentHomeCoin);

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyNoteImplCopyWith<_$DailyNoteImpl> get copyWith =>
      __$$DailyNoteImplCopyWithImpl<_$DailyNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyNoteImplToJson(
      this,
    );
  }
}

abstract class _DailyNote implements DailyNote {
  const factory _DailyNote(
      {@JsonKey(name: "current_resin") required final int currentResin,
      @JsonKey(name: "resin_recovery_time")
      required final String resinRecoveryTime,
      @JsonKey(name: "current_home_coin")
      required final int currentHomeCoin}) = _$DailyNoteImpl;

  factory _DailyNote.fromJson(Map<String, dynamic> json) =
      _$DailyNoteImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_resin")
  int get currentResin; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "resin_recovery_time")
  String get resinRecoveryTime; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: "current_home_coin")
  int get currentHomeCoin;

  /// Create a copy of DailyNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyNoteImplCopyWith<_$DailyNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
