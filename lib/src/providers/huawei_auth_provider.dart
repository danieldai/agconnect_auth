/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class HuaweiAuthProvider {
  static AGCAuthCredential credentialWithToken(String token,
      {bool autoCreateUser = true}) {
    return HuaweiAuthCredential(token, autoCreateUser, AuthProviderType.hms);
  }
}

class HuaweiAuthCredential extends AGCAuthCredential {
  String token;
  bool autoCreateUser;

  HuaweiAuthCredential(
      this.token, this.autoCreateUser, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'accessToken': token,
      'autoCreateUser': autoCreateUser
    };
  }
}
