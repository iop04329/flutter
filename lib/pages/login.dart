import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    passWordController.dispose();
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
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              )),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      print(userController.text);
                      print(passWordController.text);
                      String userVal = userController.text;
                      String passWordVal = passWordController.text;
                      if (userDataBase.containsKey(userVal)) {
                        print('有這個使用者');
                        if (userDataBase[userVal] == passWordVal) {
                          tool.showMsg('登入成功');
                          Navigator.of(context).pushNamed(RouteName.first);
                        } else {
                          tool.showMsg('密碼錯誤');
                        }
                      } else {
                        tool..showMsg('無此使用者');
                      }
                    },
                    child: Text('登入')),
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
