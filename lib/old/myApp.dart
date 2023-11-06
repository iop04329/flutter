import 'package:flutter/material.dart';
import 'package:tutorial/old/homePage.dart';

//靜態
class MyApp extends StatelessWidget {
  //class建構式
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE4A663)),
        fontFamily: 'TimesNewRoman',
        useMaterial3: true,
      ),
      home: const HomePage(title: '登入頁面'),
    );
  }
}
