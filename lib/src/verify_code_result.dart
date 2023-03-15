/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

class VerifyCodeResult {
  String? _shortestInterval;
  String? _validityPeriod;

   VerifyCodeResult(this._shortestInterval, this._validityPeriod);

   VerifyCodeResult.fromMap(Map map) {
    this._shortestInterval = map['shortestInterval'];
    this._validityPeriod = map['validityPeriod'];
  }

  String? get shortestInterval {
    return _shortestInterval;
  }

  String? get validityPeriod {
    return _validityPeriod;
  }
}
