/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

class PhoneUser {
  String countryCode;
  String phoneNumber;
  String verifyCode;
  String? password;

  PhoneUser(this.countryCode, this.phoneNumber, this.verifyCode,
      {this.password});
}
