/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class SelfBuildAuthProvider {
  static AGCAuthCredential credentialWithToken(String token,
      {bool autoCreateUser = true}) {
    return SelfBuildCredential(
        token, autoCreateUser, AuthProviderType.selfBuild);
  }
}

class SelfBuildCredential extends AGCAuthCredential {
  bool autoCreateUser;
  String token;

  SelfBuildCredential(
      this.token, this.autoCreateUser, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'autoCreateUser': autoCreateUser,
      'token': token
    };
  }
}
