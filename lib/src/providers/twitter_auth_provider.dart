/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class TwitterAuthProvider {
  static AGCAuthCredential credentialWithToken(String token, String secret,
      {bool autoCreateUser = true}) {
    return TwitterAuthCredential(
        token, autoCreateUser, secret, AuthProviderType.twitter);
  }
}

class TwitterAuthCredential extends AGCAuthCredential {
  String token;
  String secret;
  bool autoCreateUser;

  TwitterAuthCredential(
      this.token, this.autoCreateUser, this.secret, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'token': token,
      'secret': secret,
      'autoCreateUser': autoCreateUser
    };
  }
}
