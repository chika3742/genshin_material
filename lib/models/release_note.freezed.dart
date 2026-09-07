// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
ReleaseNote _$ReleaseNoteFromJson(
  Map<String, dynamic> json
) {
    return LocalizedReleaseNote.fromJson(
      json
    );
}

/// @nodoc
mixin _$ReleaseNote {

 String get releasedOn; String get version; LocalizedText get contents;



@override
bool operator ==(Object other) {
  final _this = this as ReleaseNote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReleaseNote&&(identical(other.releasedOn, _this.releasedOn) || other.releasedOn == _this.releasedOn)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.contents, _this.contents) || other.contents == _this.contents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReleaseNote;
  return Object.hash(runtimeType,_this.releasedOn,_this.version,_this.contents);
}

@override
String toString() {
  final _this = this as ReleaseNote;
  return 'ReleaseNote(releasedOn: ${_this.releasedOn}, version: ${_this.version}, contents: ${_this.contents})';
}


}





/// @nodoc
@JsonSerializable(createToJson: false)

class LocalizedReleaseNote implements ReleaseNote {
  const LocalizedReleaseNote({required this.releasedOn, required this.version, required this.contents});
  factory LocalizedReleaseNote.fromJson(Map<String, dynamic> json) => _$LocalizedReleaseNoteFromJson(json);

@override final  String releasedOn;
@override final  String version;
@override final  LocalizedText contents;




@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedReleaseNote&&(identical(other.releasedOn, releasedOn) || other.releasedOn == releasedOn)&&(identical(other.version, version) || other.version == version)&&(identical(other.contents, contents) || other.contents == contents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,releasedOn,version,contents);
}

@override
String toString() {
    return 'ReleaseNote(releasedOn: $releasedOn, version: $version, contents: $contents)';
}


}




// dart format on
