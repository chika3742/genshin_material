import "package:freezed_annotation/freezed_annotation.dart";

part "hoyolab_api.freezed.dart";
part "hoyolab_api.g.dart";

@Freezed(genericArgumentFactories: true)
class HoyolabApiResult<T> with _$HoyolabApiResult<T> {
  const HoyolabApiResult._();

  const factory HoyolabApiResult({
    required int retcode,
    required String message,
    T? data,
  }) = _HoyolabApiResult<T>;

  factory HoyolabApiResult.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$HoyolabApiResultFromJson(json, fromJsonT);

  static HoyolabApiResult<HoyolabListData<I>> fromJsonList<I>(Map<String, dynamic> json, I Function(Object?) fromJsonItem) {
    return HoyolabApiResult.fromJson(json, (Object? it) => HoyolabListData.fromJson(it as Map<String, dynamic>, fromJsonItem));
  }

  bool get hasError => retcode != 0;
}

@Freezed(genericArgumentFactories: true)
class HoyolabListData<T> with _$HoyolabListData<T> {
  const factory HoyolabListData({
    required List<T> list,
  }) = _HoyolabListData<T>;

  factory HoyolabListData.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$HoyolabListDataFromJson(json, fromJsonT);
}

@freezed
class HyvServer with _$HyvServer {
  const factory HyvServer({
    required String region,
    required String name,
  }) = _HyvServer;

  factory HyvServer.fromJson(Map<String, dynamic> json) =>
      _$HyvServerFromJson(json);
}

@freezed
class HyvUserInfo with _$HyvUserInfo {
  const factory HyvUserInfo({
    @JsonKey(name: "account_name")
    required String accountName,
  }) = _HyvUserInfo;
  
  factory HyvUserInfo.fromJson(Map<String, dynamic> json) =>
      _$HyvUserInfoFromJson(json);
}

@freezed
class HyvUserGameRole with _$HyvUserGameRole {
  const factory HyvUserGameRole({
    @JsonKey(name: "game_uid")
    required String uid,
    required String nickname,
    required int level,
  }) = _HyvUserGameRole;

  factory HyvUserGameRole.fromJson(Map<String, dynamic> json) =>
      _$HyvUserGameRoleFromJson(json);
}

typedef LookupServersResult = HoyolabApiResult<HoyolabListData<HyvServer>>;
typedef VerifyLTokenResult = HoyolabApiResult<HyvUserInfo>;
typedef GetUserGameRolesResult = HoyolabApiResult<HoyolabListData<HyvUserGameRole>>;
