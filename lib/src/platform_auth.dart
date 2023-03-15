/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2021. All rights reserved.
 */

import 'package:flutter/services.dart';

import '../agconnect_auth.dart';

class PlatformAuth {
  static const MethodChannel methodChannel =
      const MethodChannel('com.huawei.flutter/agconnect_auth');

  static const EventChannel eventChannel =
      EventChannel('com.huawei.flutter.event/agconnect_auth');

  static handlePlatformException(Object exception) {
    if (exception is PlatformException) {
      int? code = int.tryParse(exception.code);
      Map details = exception.details as Map;
      throw AGCAuthException(code, details['exceptionCode'], exception.message);
    }
    throw exception;
  }
}
