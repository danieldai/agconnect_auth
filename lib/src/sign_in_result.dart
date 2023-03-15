/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import 'package:agconnect_auth/agconnect_auth.dart';

class SignInResult {
  AGCUser? user;

  SignInResult.fromMap(Map? map) {
    this.user = map != null ? AGCUser.fromMap(map) : null;
  }
}
