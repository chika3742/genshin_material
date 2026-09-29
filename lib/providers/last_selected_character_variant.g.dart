// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_selected_character_variant.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The variant the user last selected on the details page of the character
/// group [groupId], or `null` when none has been selected yet.
///
/// The selection is persisted per group, so a stored id that the group no
/// longer lists (for one, after an asset update) is ignored.

@ProviderFor(LastSelectedCharacterVariant)
final lastSelectedCharacterVariantProvider =
    LastSelectedCharacterVariantFamily._();

/// The variant the user last selected on the details page of the character
/// group [groupId], or `null` when none has been selected yet.
///
/// The selection is persisted per group, so a stored id that the group no
/// longer lists (for one, after an asset update) is ignored.
final class LastSelectedCharacterVariantProvider
    extends $NotifierProvider<LastSelectedCharacterVariant, CharacterId?> {
  /// The variant the user last selected on the details page of the character
  /// group [groupId], or `null` when none has been selected yet.
  ///
  /// The selection is persisted per group, so a stored id that the group no
  /// longer lists (for one, after an asset update) is ignored.
  LastSelectedCharacterVariantProvider._({
    required LastSelectedCharacterVariantFamily super.from,
    required CharacterId super.argument,
  }) : super(
         retry: null,
         name: r'lastSelectedCharacterVariantProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lastSelectedCharacterVariantHash();

  @override
  String toString() {
    return r'lastSelectedCharacterVariantProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LastSelectedCharacterVariant create() => LastSelectedCharacterVariant();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CharacterId? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CharacterId?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LastSelectedCharacterVariantProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lastSelectedCharacterVariantHash() =>
    r'3729f4357c61e2c3919b2bc4571e12c97b0cf3e6';

/// The variant the user last selected on the details page of the character
/// group [groupId], or `null` when none has been selected yet.
///
/// The selection is persisted per group, so a stored id that the group no
/// longer lists (for one, after an asset update) is ignored.

final class LastSelectedCharacterVariantFamily extends $Family
    with
        $ClassFamilyOverride<
          LastSelectedCharacterVariant,
          CharacterId?,
          CharacterId?,
          CharacterId?,
          CharacterId
        > {
  LastSelectedCharacterVariantFamily._()
    : super(
        retry: null,
        name: r'lastSelectedCharacterVariantProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The variant the user last selected on the details page of the character
  /// group [groupId], or `null` when none has been selected yet.
  ///
  /// The selection is persisted per group, so a stored id that the group no
  /// longer lists (for one, after an asset update) is ignored.

  LastSelectedCharacterVariantProvider call(CharacterId groupId) =>
      LastSelectedCharacterVariantProvider._(argument: groupId, from: this);

  @override
  String toString() => r'lastSelectedCharacterVariantProvider';
}

/// The variant the user last selected on the details page of the character
/// group [groupId], or `null` when none has been selected yet.
///
/// The selection is persisted per group, so a stored id that the group no
/// longer lists (for one, after an asset update) is ignored.

abstract class _$LastSelectedCharacterVariant extends $Notifier<CharacterId?> {
  late final _$args = ref.$arg as CharacterId;
  CharacterId get groupId => _$args;

  CharacterId? build(CharacterId groupId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CharacterId?, CharacterId?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CharacterId?, CharacterId?>,
              CharacterId?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
