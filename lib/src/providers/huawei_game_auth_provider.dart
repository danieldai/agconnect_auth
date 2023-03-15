/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import '../../agconnect_auth.dart';

class HuaweiGameAuthProvider {
  static AGCAuthCredential credentialWithToken(
      String playerSign,
      String imageUrl,
      int playerLevel,
      String playerId,
      String displayName,
      String signTs,
      {bool autoCreateUser = true}) {
    return HuaweiGameAuthCredential(
        autoCreateUser,
        playerSign,
        imageUrl,
        playerLevel,
        playerId,
        displayName,
        signTs,
        AuthProviderType.huaweiGame);
  }
}

class HuaweiGameAuthCredential extends AGCAuthCredential {
  bool autoCreateUser;
  String playerSign;
  String imageUrl;
  int playerLevel;
  String playerId;
  String displayName;
  String signTs;

  HuaweiGameAuthCredential(
      this.autoCreateUser,
      this.playerSign,
      this.imageUrl,
      this.playerLevel,
      this.playerId,
      this.displayName,
      this.signTs,
      AuthProviderType provider)
      : super(provider);

  @override
  Map toMap() {
    return {
      'autoCreateUser': autoCreateUser,
      'provider': provider.index,
      'playerSign': playerSign,
      'imageUrl': imageUrl,
      'playerLevel': playerLevel,
      'playerId': playerId,
      'displayName': displayName,
      'signTs': signTs
    };
  }
}
