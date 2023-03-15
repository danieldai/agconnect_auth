/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

class AGCUserExtra {
  String? _createTime;
  String? _lastSignInTime;

  AGCUserExtra(this._createTime, this._lastSignInTime);

  AGCUserExtra.fromMap(Map map) {
    this._createTime = map['createTime'];
    this._lastSignInTime = map['lastSignInTime'];
  }

  String? get createTime {
    return _createTime;
  }

  String? get lastSignInTime {
    return _lastSignInTime;
  }
}
