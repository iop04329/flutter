import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutorial/old/fivePage.dart';
import 'package:tutorial/old/firstPage.dart';
import 'package:tutorial/old/fourPage.dart';
import 'package:tutorial/old/secondPage.dart';
import 'package:tutorial/old/thirdPage.dart';
import 'package:tutorial/pages/front.dart';
import 'package:tutorial/pages/register.dart';
import 'package:get_it/get_it.dart';

//GetIt 註冊單例
final locator = GetIt.instance;
void setup() {
  locator.registerSingleton<Http_service>(Http_service());
}

//changeNotifier
//1. define class
//2. define value who u want to listen change
//3. write a function u using to change value in the end u should call notifyListeners
class totalModel with ChangeNotifier {
  double _addTotal = 0;
  double get addTotal => _addTotal;

  double _reduceTotal = 0;
  double get reduceTotal => _reduceTotal;

  void add(double a, double b) {
    _addTotal = a + b;
    notifyListeners();
  }

  void reduce(double a, double b) {
    _reduceTotal = a - b;
    notifyListeners();
  }
}

//自製套件
//共用區域
//列舉
//路由管理
class RouteName {
  static const first = '/first';
  static const second = '/second';
  static const third = '/third';
  static const four = '/four';
  static const five = '/five';
  static const register = '/register';
  static const front = '/front';
}

Map<String, WidgetBuilder> routes = {
  RouteName.first: (_) => firstPage(text: '第一頁'),
  RouteName.second: (_) => secondPage(text: '第二頁'),
  RouteName.third: (_) => thirdPage(text: '第三頁'),
  RouteName.four: (_) => fourPage('第四頁'),
  RouteName.five: (_) => fivePage('第五頁'),
  RouteName.register: (_) => registerPage(),
  RouteName.front: (_) => frontPage(),
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

//simple dataBase
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

//lesson 12
class Http_service {
  final dio = Dio();
  String token = '';
  Http_service() {
    dio.options.baseUrl = 'https://b1ec-125-230-177-164.ngrok-free.app';
  }

  setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  setFakeToken(String token) {
    this.token = token;
  }

  Future<Map<String, dynamic>> login(String account, String password) async {
    FormData params = FormData.fromMap({
      'account': account,
      'password': password,
    });
    Response response = await dio.post('/getToken', data: params);
    Map<String, dynamic> result = response.data;
    if (result['result'] == 'OK') {
      setFakeToken(result['jwtToken']);
    }
    return result;
  }

  Future<Response> login2(String account, String password) async {
    FormData params = FormData.fromMap({
      'account': account,
      'password': password,
    });
    Response response = await dio.postUri(Uri(host: 'https://b1ec-125-230-177-164.ngrok-free.app', path: '/getToken'), data: params);

    return response;
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
//11/21 leeson 10 狀態管理 share prefernce login register
//test
//lesson 11 GetIt ChangeNotifier  homework add a reduceTotal 
// 1.全域參數
// 2.不會被修改或初始化
// 3.api token
// 4. tutorial changeNotifier : https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html
//lesson 12 dio(Http) try catch(異常流程)
//lesson 13 valueNotifier