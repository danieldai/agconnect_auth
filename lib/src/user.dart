/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import 'dart:ui';

import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:agconnect_auth/src/token_result.dart';

import 'platform_auth.dart';

class AGCUser {
  bool? _isAnonymous;
  String? _uid;
  String? _email;
  String? _phone;
  String? _displayName;
  String? _photoUrl;
  AuthProviderType? _providerId;
  List<Map<String, String>>? _providerInfo;
  bool? _emailVerified;
  bool? _passwordSet;

  AGCUser.fromMap(Map map) {
    _updateUser(map);
  }

  void _updateUser(Map? map) {
    map ??= new Map();
    this._isAnonymous = map['isAnonymous'];
    this._uid = map['uid'];
    this._email = map['email'];
    this._phone = map['phone'];
    this._displayName = map['displayName'];
    this._photoUrl = map['photoUrl'];
    this._providerId = AuthProviderType.values[map['providerId']];
    this._providerInfo = (map['providerInfo'] as List?)
        ?.map((e) => (e as Map)
            .map((key, value) => MapEntry(key.toString(), value.toString())))
        .toList(growable: false);
    this._emailVerified = map['emailVerified'] == 1;
    this._passwordSet = map['passwordSet'] == 1;
  }

  bool? get isAnonymous {
    return _isAnonymous;
  }

  String? get uid {
    return _uid;
  }

  String? get email {
    return _email;
  }

  String? get phone {
    return _phone;
  }

  String? get displayName {
    return _displayName;
  }

  String? get photoUrl {
    return _photoUrl;
  }

  AuthProviderType? get providerId {
    return _providerId;
  }

  List<Map<String, String>>? get providerInfo {
    return _providerInfo;
  }

  bool? get emailVerified {
    return _emailVerified;
  }

  bool? get passwordSet {
    return _passwordSet;
  }

  Future<SignInResult> link(AGCAuthCredential credential) {
    assert(credential != null);
    return PlatformAuth.methodChannel.invokeMethod('link',
        <String, dynamic>{'credential': credential.toMap()}).then((value) {
      _updateUser(value);
      return SignInResult.fromMap(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<SignInResult> unlink(AuthProviderType provider) {
    return PlatformAuth.methodChannel.invokeMethod(
        'unlink', <String, dynamic>{'provider': provider.index}).then((value) {
      _updateUser(value);
      return SignInResult.fromMap(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> updateProfile(ProfileRequest profile) {
    assert(profile != null);
    return PlatformAuth.methodChannel.invokeMethod(
        'updateProfile', <String, dynamic>{
      'displayName': profile.displayName,
      'photoUrl': profile.photoUrl
    }).then((value) {
      _updateUser(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> updateEmail(String newEmail, String newVerifyCode,
      {Locale? locale}) {
    return PlatformAuth.methodChannel
        .invokeMethod('updateEmail', <String, dynamic>{
      'email': newEmail,
      'verifyCode': newVerifyCode,
      'localeLanguage': locale?.languageCode,
      'localeCountry': locale?.countryCode,
    }).then((value) {
      _updateUser(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> updatePhone(
      String countryCode, String phoneNumber, String newVerifyCode,
      {Locale? locale}) {
    return PlatformAuth.methodChannel
        .invokeMethod('updatePhone', <String, dynamic>{
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'verifyCode': newVerifyCode,
      'localeLanguage': locale?.languageCode,
      'localeCountry': locale?.countryCode,
    }).then((value) {
      _updateUser(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> updatePassword(
      String newPassword, String verifyCode, AuthProviderType provider) {
    assert(newPassword != null);
    assert(verifyCode != null);
    assert(provider != null);
    return PlatformAuth.methodChannel.invokeMethod(
        'updatePassword', <String, dynamic>{
      'password': newPassword,
      'verifyCode': verifyCode,
      'provider': provider.index
    }).then((value) {
      _updateUser(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<AGCUserExtra> get userExtra {
    return PlatformAuth.methodChannel
        .invokeMethod('getUserExtra')
        .then((value) {
      _updateUser(value['user']);
      return AGCUserExtra.fromMap(value['userExtra']);
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<TokenResult> getToken({bool forceRefresh = false}) {
    return PlatformAuth.methodChannel.invokeMethod('getToken',
        <String, dynamic>{'forceRefresh': forceRefresh}).then((value) {
      return TokenResult.fromMap(value);
    }).catchError(PlatformAuth.handlePlatformException);
  }
}
