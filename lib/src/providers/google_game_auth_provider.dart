/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class GoogleGameAuthProvider {
  static AGCAuthCredential credentialWithToken(String serverAuthCode,
      {bool autoCreateUser = true}) {
    return GoogleGameAuthCredential(
        serverAuthCode, autoCreateUser, AuthProviderType.googleGame);
  }
}

class GoogleGameAuthCredential extends AGCAuthCredential {
  String serverAuthCode;
  bool autoCreateUser;

  GoogleGameAuthCredential(
      this.serverAuthCode, this.autoCreateUser, AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'serverAuthCode': serverAuthCode,
      'autoCreateUser': autoCreateUser
    };
  }
}
