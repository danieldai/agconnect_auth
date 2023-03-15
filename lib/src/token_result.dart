/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

class TokenResult {
  String? _token;
  int? _expirePeriod;

  TokenResult(this._token, this._expirePeriod);

  TokenResult.fromMap(Map map) {
    this._token = map['token'];
    this._expirePeriod = map['expirePeriod'];
  }

  int? get expirePeriod {
    return _expirePeriod;
  }

  String? get token {
    return _token;
  }
}
