/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class WeiXinAuthProvider {
  static AGCAuthCredential credentialWithToken(String token, String openId,
      {bool autoCreateUser = true}) {
    return WeiXinAuthCredential(
        token, openId, autoCreateUser, AuthProviderType.wechat);
  }
}

class WeiXinAuthCredential extends AGCAuthCredential {
  String token;
  String openId;
  bool autoCreateUser;

  WeiXinAuthCredential(
      this.token, this.openId, this.autoCreateUser, AuthProviderType provider)
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
