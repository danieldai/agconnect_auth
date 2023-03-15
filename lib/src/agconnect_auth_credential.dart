/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

enum AuthProviderType {
  anonymous,
  hms,
  facebook,
  twitter,
  wechat,
  huaweiGame,
  qq,
  weibo,
  google,
  googleGame,
  selfBuild,
  phone,
  email,
  apple,
}

class AGCAuthCredential {
  AuthProviderType provider;

  AGCAuthCredential(this.provider);

  Map toMap() {
    return {'provider': provider.index};
  }
}
