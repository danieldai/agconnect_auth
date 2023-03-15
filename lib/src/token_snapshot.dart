/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

enum TokenState { signedIn, tokenUpdated, tokenInvalid, signedOut }

class TokenSnapshot {
  TokenState? _state;
  String? _token;

  TokenSnapshot(this._state, this._token);

  TokenSnapshot.fromMap(Map map) {
    this._token = map['token'];
    int stateNum = map['state'];
    this._state = TokenState.values[stateNum];
  }

  TokenState? get state {
    return _state;
  }

  String? get token {
    return _token;
  }
}
