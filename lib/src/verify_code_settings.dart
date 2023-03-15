/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import 'dart:ui';

enum VerifyCodeAction {
  registerLogin,
  resetPassword,
}

class VerifyCodeSettings {
  VerifyCodeAction action;
  Locale? locale;
  int sendInterval;

  VerifyCodeSettings(this.action, {this.sendInterval = 0, this.locale});

  Map toMap() {
    return {
      'action': action.index,
      'localeLanguage': locale?.languageCode,
      'localeCountry': locale?.countryCode,
      'sendInterval': sendInterval
    };
  }
}
