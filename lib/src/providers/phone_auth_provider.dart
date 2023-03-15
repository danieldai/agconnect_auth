/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */


import '../../agconnect_auth.dart';
import '../platform_auth.dart';

class PhoneAuthProvider {
  static AGCAuthCredential credentialWithPassword(
      String countryCode, String phoneNumber, String password) {
    return PhoneAuthCredential(
        countryCode, phoneNumber, password, null, AuthProviderType.phone);
  }

  static AGCAuthCredential credentialWithVerifyCode(
      String countryCode, String phoneNumber, String verifyCode,
      {required String password}) {
    return PhoneAuthCredential(
        countryCode, phoneNumber, password, verifyCode, AuthProviderType.phone);
  }

  static Future<VerifyCodeResult?> requestVerifyCode(
      String countryCode, String phoneNumber, VerifyCodeSettings settings) {
    return PlatformAuth.methodChannel
        .invokeMethod('requestPhoneVerifyCode', <String, dynamic>{
          'countryCode': countryCode,
          'phoneNumber': phoneNumber,
          'settings': settings.toMap(),
        })
        .then((value) => value != null ? VerifyCodeResult.fromMap(value) : null)
        .catchError(PlatformAuth.handlePlatformException);
  }
}

class PhoneAuthCredential extends AGCAuthCredential {
  String countryCode;
  String phoneNumber;
  String password;
  String? verifyCode;

  PhoneAuthCredential(this.countryCode, this.phoneNumber, this.password,
      this.verifyCode, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'password': password,
      'verifyCode': verifyCode
    };
  }
}
