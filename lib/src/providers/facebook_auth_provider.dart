/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class FacebookAuthProvider {
  static AGCAuthCredential credentialWithToken(String token,
      {bool autoCreateUser = true}) {
    return FacebookAuthCredential(
        token, autoCreateUser, AuthProviderType.facebook);
  }
}

class FacebookAuthCredential extends AGCAuthCredential {
  bool autoCreateUser;
  String token;

  FacebookAuthCredential(
      this.token, this.autoCreateUser, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'autoCreateUser': autoCreateUser,
      'accessToken': token
    };
  }
}
