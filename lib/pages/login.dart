import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/pages/register.dart';
import 'package:tutorial/tool/pub.dart';
import 'package:tutorial/tool/pub.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  tool_api tool = tool_api();
  bool isVisibile = false;
  Http_service api = locator<Http_service>();
  Dio dio = Dio();

  switchVisible() {
    isVisibile = !isVisibile;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    passWordController.dispose();
  }

  login() async {
    print(userController.text);
    print(passWordController.text);
    String userVal = userController.text;
    String passWordVal = passWordController.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userIdList = prefs.getStringList(registerName.userId.name);
    List<String>? pswdList = prefs.getStringList(registerName.pswd.name);
    int Ind = -1;
    if (userIdList != null) {
      if (userIdList.contains(userVal)) {
        Ind = userIdList.indexOf(userVal);
        if (pswdList != null) {
          if (pswdList[Ind] == passWordVal) {
            tool.showMsg('登入成功');
            Navigator.pop(context, 'hello world');
            await Navigator.of(context).pushNamed(RouteName.front);
          }
        }
      }
    }
    tool.showMsg('登入失敗');
  }

  login_api() async {
    //lesson 12
    String userVal = userController.text;
    String passWordVal = passWordController.text;
    Map<String, dynamic> res = await api.login(userVal, passWordVal);
    if (res['result'] == 'OK') {
      tool.showMsg('登入成功 ${res['jwtToken']}');
      Navigator.pop(context, 'hello world');
      await Navigator.of(context).pushNamed(RouteName.front);
    } else {
      tool.showMsg('登入失敗 ${res['jwtToken']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    //account
    //textfield 值
    //btn的功能 去執行
    return Scaffold(
        appBar: AppBar(title: Text('登入頁面')),
        body: Container(
          //expanded元件
          padding: EdgeInsets.only(left: 50, right: 50),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'User ID',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                  child: TextField(
                controller: userController,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'User ID'),
              )),
              SizedBox(height: 10),
              Text(
                'Password',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                    controller: passWordController,
                    obscureText: isVisibile,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: switchVisible,
                          icon: Icon(isVisibile ? Icons.visibility_off : Icons.visibility, size: 30, color: Colors.grey)), // 密碼鎖的圖示
                    )),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(onPressed: () => login(), child: Text('登入')),
              ),
              Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const registerPage(),
                          ),
                        );
                      },
                      child: Text(
                        '註冊',
                        style: TextStyle(color: Colors.blue, fontSize: 20, decoration: TextDecoration.underline),
                      )))
            ],
          ),
        ));
  }
}
