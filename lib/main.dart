//套件包
//import 放入 輸入
//pubspec.yaml
import 'package:flutter/material.dart';
import 'package:tutorial/pages/login.dart';
import 'package:tutorial/tool/pub.dart';

void main() {
  setup(); //singleTon
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes, //註冊頁面
      home: login(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.transparent),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // 设置按钮边框的弧度为5
                  )))),
    );
  }
}
