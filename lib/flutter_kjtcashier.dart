/*
 * @Author: zhengzhuang
 * @Date: 2020-11-07 09:06:15
 * @LastEditors: zhengzhuang
 * @LastEditTime: 2020-11-07 16:16:23
 * @Description: In User Settings Edit
 * @FilePath: /flutter_kjtcashier/lib/flutter_kjtcashier.dart
 */

import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKjtcashier {
  static const MethodChannel _channel =
      const MethodChannel('flutter_kjtcashier');

  static Future<String> kjtcashierAliPay(token) async {
    final String version = await _channel.invokeMethod('kjtcashier_ali_pay', {"token": token});
    return version;
  }
}
