/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

class EmailUser {
  String email;
  String verifyCode;
  String? password;

  EmailUser(this.email, this.verifyCode, {this.password});
}
