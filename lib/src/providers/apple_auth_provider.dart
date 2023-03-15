/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 *
 */

import '../../agconnect_auth.dart';

class AppleAuthProvider {
  static AGCAuthCredential credentialWithToken(
      String identityToken, String nonce,
      {bool autoCreateUser = true}) {
    return AppleAuthCredential(
        identityToken, nonce, autoCreateUser, AuthProviderType.apple);
  }
}

class AppleAuthCredential extends AGCAuthCredential {
  String identityToken;
  String nonce;
  bool autoCreateUser;

  AppleAuthCredential(this.identityToken, this.nonce, this.autoCreateUser,
      AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'provider': provider.index,
      'identityToken': identityToken,
      'nonce': nonce,
      'autoCreateUser': autoCreateUser
    };
  }
}
