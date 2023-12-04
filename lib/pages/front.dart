import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tutorial/tool/pub.dart';

class frontPage extends StatefulWidget {
  const frontPage({super.key});

  @override
  State<frontPage> createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  api_GetIt api = locator<api_GetIt>();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  final totalModel totalNotifier = totalModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首頁')),
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
                '恭喜登入成功 Token:${api.token}', //Getit
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                child: Marquee(
                  text: '台積電狂漲8元！權值股強強聯手撐盤 台股狂噴206點「站上17400大關」',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(onPressed: () {}, child: Text('登入')),
              ),
              SizedBox(height: 20),
              Row(children: [
                Container(
                  width: 80,
                  height: 50,
                  child: TextField(
                      controller: t1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'value',
                      )),
                ),
                SizedBox(width: 20),
                Icon(Icons.add),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 50,
                  child: TextField(
                      controller: t2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'value',
                      )),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      tool_api tool = tool_api();
                      double? v1 = double.tryParse(t1.text);
                      double? v2 = double.tryParse(t2.text);
                      if (v1 == null || v2 == null) {
                        tool.showMsg('請確認輸入的參數');
                        return;
                      }
                      totalNotifier.add(v1, v2);
                    },
                    child: Text('計算'))
              ]),
              ListenableBuilder(
                listenable: totalNotifier,
                builder: (BuildContext context, Widget? child) {
                  return Text('結果為:${totalNotifier.addTotal}', style: TextStyle(fontSize: 20));
                },
              ),
            ],
          ),
        ));
  }
}
