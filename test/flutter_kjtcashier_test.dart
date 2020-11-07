/*
 * @Author: zhengzhuang
 * @Date: 2020-11-07 09:06:16
 * @LastEditors: zhengzhuang
 * @LastEditTime: 2020-11-07 16:16:36
 * @Description: In User Settings Edit
 * @FilePath: /flutter_kjtcashier/test/flutter_kjtcashier_test.dart
 */
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kjtcashier/flutter_kjtcashier.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_kjtcashier');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterKjtcashier.kjtcashierAliPay, '42');
  });
}
