sealed class RemoteConfigKey<T extends Object> {
  final String key;

  const RemoteConfigKey(this.key);
}

class BoolRemoteConfigKey extends RemoteConfigKey<bool> {
  const BoolRemoteConfigKey(super.key);
}

class StringRemoteConfigKey extends RemoteConfigKey<String> {
  const StringRemoteConfigKey(super.key);
}

class IntRemoteConfigKey extends RemoteConfigKey<int> {
  const IntRemoteConfigKey(super.key);
}
