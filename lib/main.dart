//套件包
//import 放入 輸入
//pubspec.yaml
import 'package:flutter/material.dart';
import 'package:tutorial/pages/firstPage.dart';
import 'package:tutorial/pages/login.dart';
import 'package:tutorial/pages/loginPage.dart';
import 'package:tutorial/tool/pub.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes, //註冊頁面
      home: login(),
    );
  }
}
