import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_kjtcashier/flutter_kjtcashier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await FlutterKjtcashier.kjtcashierAliPay('b6af7ae563a0434ab6f6aff91801df66');
    } on PlatformException {
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: MaterialButton(
            child: Text("快捷通支付"),
              color: Colors.orange,
              onPressed: () {
              print("快捷通支付");
              initPlatformState();
            }),
          // child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
