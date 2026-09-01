// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hoyolab_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HoyolabCredentialState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoyolabCredentialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HoyolabCredentialState()';
}


}





/// @nodoc


class UnlinkedHoyolabCredential extends HoyolabCredentialState {
  const UnlinkedHoyolabCredential(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnlinkedHoyolabCredential);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HoyolabCredentialState.unlinked()';
}


}




/// @nodoc


class LinkedHoyolabCredential extends HoyolabCredentialState {
  const LinkedHoyolabCredential({required this.server, required this.serverName, required this.userName, required this.uid}): super._();
  

/// The region of the selected server, e.g. `os_asia`.
 final  String server;
 final  String serverName;
 final  String userName;
 final  String uid;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkedHoyolabCredential&&(identical(other.server, server) || other.server == server)&&(identical(other.serverName, serverName) || other.serverName == serverName)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,server,serverName,userName,uid);

@override
String toString() {
  return 'HoyolabCredentialState.linked(server: $server, serverName: $serverName, userName: $userName, uid: $uid)';
}


}




// dart format on
