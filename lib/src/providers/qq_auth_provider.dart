/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class QQAuthProvider {
  static AGCAuthCredential credentialWithToken(String token, String openId,
      {bool autoCreateUser = true}) {
    return QQAuthCredential(token, autoCreateUser, openId, AuthProviderType.qq);
  }
}

class QQAuthCredential extends AGCAuthCredential {
  String token;
  String openId;
  bool autoCreateUser;

  QQAuthCredential(
      this.token, this.autoCreateUser, this.openId, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'accessToken': token,
      'openId': openId,
      'autoCreateUser': autoCreateUser
    };
  }
}
