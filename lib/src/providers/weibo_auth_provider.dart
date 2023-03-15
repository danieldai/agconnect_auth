/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class WeiBoAuthProvider {
  static AGCAuthCredential credentialWithToken(String token, String uid,
      {bool autoCreateUser = true}) {
    return WeiBoAuthCredential(
        token, uid, autoCreateUser, AuthProviderType.weibo);
  }
}

class WeiBoAuthCredential extends AGCAuthCredential {
  String token;
  String uid;
  bool autoCreateUser;

  WeiBoAuthCredential(
      this.token, this.uid, this.autoCreateUser, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'token': token,
      'uid': uid,
      'autoCreateUser': autoCreateUser
    };
  }
}
