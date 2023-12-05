import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/tool/pub.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  tool_api tool = tool_api();
  bool isVisibile = false;
  Http_service api = locator<Http_service>();

  registerData(String key, String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? dataList = prefs.getStringList(key);
    if (dataList == null) {
      await prefs.setStringList(key, <String>[val]); //[user1]
    } else {
      dataList.add(val); // [user1,user2,....]
      prefs.setStringList(key, dataList);
    }
  }

  registerDatabyEnum(registerName key, String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? dataList = prefs.getStringList(key.name);
    if (dataList == null) {
      await prefs.setStringList(key.name, <String>[val]); //[user1]
    } else {
      dataList.add(val); // [user1,user2,....]
      prefs.setStringList(key.name, dataList);
    }
  }

  Future<bool> checkIsRegister(String userId, String mail) async {
    //1.get email userId
    //2.compare data
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userIdList = prefs.getStringList(registerName.userId.name);
    List<String>? mailList = prefs.getStringList(registerName.mail.name);
    if (userIdList != null) {
      if (userIdList.contains(userId)) {
        return true;
      }
    }
    if (mailList != null) {
      if (mailList.contains(mail)) {
        return true;
      }
    }
    return false;
  }

  getUserNumbers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? dataList = prefs.getStringList(registerName.userId.name);
    if (dataList == null) {
      tool.showMsg('no User');
    } else {
      tool.showMsg('There is ${dataList.length} Users');
    }
  }

  switchVisible() {
    isVisibile = !isVisibile; // false true false true
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('註冊頁面')),
        body: Container(
          //expanded元件
          padding: EdgeInsets.only(left: 50, right: 50),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
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
              Text(
                '電子郵件',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                  child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '@mail.com',
                ),
              )),
              Text(
                '電話',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                  child: TextField(
                controller: phoneController,
                obscureText: isVisibile,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '09xx',
                  suffixIcon: IconButton(
                      onPressed: switchVisible,
                      icon: Icon(isVisibile ? Icons.visibility_off : Icons.visibility, size: 30, color: Colors.grey)), // 密碼鎖的圖示
                ),
              )),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () async {
                      //1. get value
                      //2. length > 0
                      //3. check mail
                      //4. check phone length = 10 [0][1] = 0 9
                      //5. save data to sql or sharePrefernce
                      String userVal = userController.text;
                      String passWordVal = passWordController.text;
                      String mailVal = emailController.text;
                      String phoneVal = phoneController.text;
                      if (userVal.isEmpty || passWordVal.isEmpty || mailVal.isEmpty || phoneVal.isEmpty) {
                        tool.showMsg('請確保輸入格式正確'); // and or nor
                        return; //break
                      }
                      if (!tool.isEmail(mailVal)) {
                        tool.showMsg('請確保email格式正確');
                        return; //break
                      }
                      if (phoneVal[0] != '0' && phoneVal[1] != '9' && phoneVal.length != 10) {
                        tool.showMsg('請確保phone格式正確');
                        return; //break
                      }
                      if (await checkIsRegister(userVal, mailVal)) {
                        tool.showMsg('已註冊');
                        return; //break
                      }
                      registerData(registerName.userId.name, userVal);
                      registerData(registerName.pswd.name, passWordVal);
                      registerData(registerName.mail.name, mailVal);
                      registerData(registerName.phone.name, phoneVal);
                      tool.showMsg('註冊成功');
                    },
                    child: Text('註冊')),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(onPressed: getUserNumbers, child: Text('查看使用者數量')),
              ),
            ],
          ),
        ));
  }
}
