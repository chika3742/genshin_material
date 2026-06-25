import "../models/remote_config_key.dart";

abstract final class RemoteConfigKeys {
  static const bannerKey = StringRemoteConfigKey("banner_key");

  static const hoyolabLinkEnabled = BoolRemoteConfigKey("hoyolab_link_enabled");

  static const showBanner = BoolRemoteConfigKey("banner_shown");

  static const bannerText = StringRemoteConfigKey("banner_text");

  static const bannerActionUrl = StringRemoteConfigKey("banner_action_url");

  static const bannerActionText = StringRemoteConfigKey("banner_action_text");

  static const minimumAssetSchemaVersion = IntRemoteConfigKey("minimum_asset_schema_version");

  /// Default values for Remote Config
  static final defaults = {
    showBanner.key: false,
    hoyolabLinkEnabled.key: false,
  };
}
