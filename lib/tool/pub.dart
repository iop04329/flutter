import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutorial/pages/fivePage.dart';
import 'package:tutorial/pages/firstPage.dart';
import 'package:tutorial/pages/fourPage.dart';
import 'package:tutorial/pages/secondPage.dart';
import 'package:tutorial/pages/thirdPage.dart';
//自製套件
//共用區域
//列舉

//路由管理
class RouteName {
  static const first = 'first';
  static const second = 'second';
  static const third = 'third';
  static const four = 'four';
  static const five = 'five';
  static const register = 'register';
}

Map<String, WidgetBuilder> routes = {
  RouteName.first: (_) => firstPage(text: '第一頁'),
  RouteName.second: (_) => secondPage(text: '第二頁'),
  RouteName.third: (_) => thirdPage(text: '第三頁'),
  RouteName.four: (_) => fourPage('第四頁'),
  RouteName.five: (_) => fivePage('第五頁'),
  RouteName.register: (_) => fivePage('第五頁'),
};

enum profileName {
  name,
  sender,
  age,
}

enum registerName {
  userId,
  pswd,
  mail,
  phone,
}

Map userDataBase = {
  'test1': '1234',
  'test2': '0000',
  'test3': '5555',
  'test4': '7777',
};

class tool_api {
  showMsg(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 20,
    );
  }

  bool isEmail(String input) {
    // String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'; // 簡單的電子郵件地址正則表達式
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+([\w-]{2,}|[\w-]+\.[\w-]+)$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(input);
  }
}
//lesson 1 介紹
//lesson 2 基礎語法
//lesson 3 常用表達式
//lesson 4 布局 scaffold appbar bottombar column row container button*
//lesson 5 async thread timer future 同步跟非同步 注意 debug方式 column row container expanded layoutbuilder
//lesson 6 class abstract 物件導向
//lesson 7 匿名函示 Gesture元件 onTap意思 
//lesson 7 導航Navigator用法 pop push 非同步用法 await future
//網址:https://book.flutterchina.club/chapter2/flutter_router.html#_2-4-4-%E8%B7%AF%E7%94%B1%E4%BC%A0%E5%80%BC
//lesson 8 導航註冊
//lesson 9 textfield 畫面建立 controller 功能 
//leeson 10 狀態管理 share prefernce