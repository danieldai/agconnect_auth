/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class GoogleAuthProvider {
  static AGCAuthCredential credentialWithToken(String token,
      {bool autoCreateUser = true}) {
    return GoogleAuthCredential(token, autoCreateUser, AuthProviderType.google);
  }
}

class GoogleAuthCredential extends AGCAuthCredential {
  bool autoCreateUser;
  String token;

  GoogleAuthCredential(
      this.token, this.autoCreateUser, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'autoCreateUser': autoCreateUser,
      'idToken': token
    };
  }
}
