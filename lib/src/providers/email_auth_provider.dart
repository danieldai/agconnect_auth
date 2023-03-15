/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';
import '../platform_auth.dart';

class EmailAuthProvider {
  static AGCAuthCredential credentialWithPassword(
      String email, String password) {
    return EmailAuthCredential(email, password, "", AuthProviderType.email);
  }

  static AGCAuthCredential credentialWithVerifyCode(
       String email,  String verifyCode,
      { String? password}) {
    return EmailAuthCredential(
        email, "", verifyCode, AuthProviderType.email);
  }

  static Future<VerifyCodeResult?> requestVerifyCode(
      String email, VerifyCodeSettings settings) {
    return PlatformAuth.methodChannel
        .invokeMethod('requestEmailVerifyCode', <String, dynamic>{
          'email': email,
          'settings': settings.toMap(),
        })
        .then((value) => value != null ? VerifyCodeResult.fromMap(value) : null)
        .catchError(PlatformAuth.handlePlatformException);
  }
}

class EmailAuthCredential extends AGCAuthCredential {
  String email;
  String password;
  String verifyCode;

  EmailAuthCredential(
      this.email, this.password, this.verifyCode, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'email': email,
      'password': password,
      'verifyCode': verifyCode
    };
  }
}
