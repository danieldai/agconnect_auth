/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import 'dart:async';

import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:agconnect_auth/src/platform_auth.dart';
import 'package:flutter/services.dart';

class AGCAuth {
  final MethodChannel _channel = PlatformAuth.methodChannel;
  final Stream<dynamic> _tokenListener =
      PlatformAuth.eventChannel.receiveBroadcastStream();

  /// 获取AGCAuth实例
  static final AGCAuth instance = AGCAuth();

  Future<SignInResult> signIn(AGCAuthCredential credential) {
    return _channel
        .invokeMethod(
            'signIn', <String, dynamic>{'credential': credential.toMap()})
        .then((value) => SignInResult.fromMap(value))
        .catchError(PlatformAuth.handlePlatformException);
  }

  Future<SignInResult> signInAnonymously() {
    return _channel
        .invokeMethod('signInAnonymously')
        .then((value) => SignInResult.fromMap(value))
        .catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> signOut() {
    return _channel
        .invokeMethod('signOut')
        .catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> deleteUser() {
    return _channel
        .invokeMethod('deleteUser')
        .catchError(PlatformAuth.handlePlatformException);
  }

  Future<AGCUser?> get currentUser {
    return _channel
        .invokeMethod('getCurrentUser')
        .then((value) => value != null ? AGCUser.fromMap(value) : null)
        .catchError(PlatformAuth.handlePlatformException);
  }

  Stream<TokenSnapshot> tokenChanges() {
    return _tokenListener.map((event) => TokenSnapshot.fromMap(event));
  }

  Future<SignInResult> createEmailUser(EmailUser user) {
    return _channel
        .invokeMethod('createUserWithEmail', <String, dynamic>{
          'email': user.email,
          'password': user.password,
          'verifyCode': user.verifyCode
        })
        .then((value) => SignInResult.fromMap(value))
        .catchError(PlatformAuth.handlePlatformException);
  }

  Future<SignInResult> createPhoneUser(PhoneUser user) {
    return _channel
        .invokeMethod('createUserWithPhone', <String, dynamic>{
          'countryCode': user.countryCode,
          'phoneNumber': user.phoneNumber,
          'password': user.password,
          'verifyCode': user.verifyCode
        })
        .then((value) => SignInResult.fromMap(value))
        .catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> resetPasswordWithEmail(
      String email, String newPassword, String verifyCode) {
    return _channel.invokeMethod('resetPasswordWithEmail', <String, dynamic>{
      'email': email,
      'password': newPassword,
      'verifyCode': verifyCode
    }).catchError(PlatformAuth.handlePlatformException);
  }

  Future<void> resetPasswordWithPhone(String countryCode, String phoneNumber,
      String newPassword, String verifyCode) {
    return _channel.invokeMethod('resetPasswordWithPhone', <String, dynamic>{
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'password': newPassword,
      'verifyCode': verifyCode
    }).catchError(PlatformAuth.handlePlatformException);
  }
}
