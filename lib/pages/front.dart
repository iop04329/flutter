import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tutorial/pages/addLoading.dart';
import 'package:tutorial/tool/pub.dart';

class frontPage extends StatefulWidget {
  const frontPage({super.key});

  @override
  State<frontPage> createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  final totalModel totalNotifier = totalModel();
  final ValueNotifier<double> totalValNotifier = ValueNotifier(0);
  double start = 0.0;
  double end = 0.25;

  onTapLoading() {
    if (end == 1) {
      start = 0;
      end = 0;
      setState(() {});
      return;
    }
    start = end;
    end += 0.25;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首頁'),
        centerTitle: false,
      ),
      body: Container(
        //expanded元件
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '恭喜登入成功 Token:', //Getit
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
            //valueNotier
            Row(children: [
              Container(
                width: 80,
                height: 50,
                child: TextField(
                    controller: t3,
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
                    controller: t4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'value',
                    )),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    tool_api tool = tool_api();
                    double? v3 = double.tryParse(t3.text);
                    double? v4 = double.tryParse(t4.text);
                    if (v3 == null || v4 == null) {
                      tool.showMsg('請確認輸入的參數');
                      return;
                    }
                    totalValNotifier.value = v3 + v4;
                  },
                  child: Text('計算'))
            ]),
            ValueListenableBuilder<double>(
              valueListenable: totalValNotifier,
              child: Text('hello', style: const TextStyle(fontSize: 24)),
              builder: (BuildContext context, double value, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '結果為:${value}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    child!,
                  ],
                );
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return addLoadingPage();
                }));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
            TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: start, end: end),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, _) => Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(color: Color(0xFFA6C2FA), shape: BoxShape.circle),
                          child: CircularProgressIndicator(
                            color: Color(0xFFC8D0D4),
                            value: value,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTapLoading,
                          child: Icon(Icons.chevron_right, size: 30),
                        )
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
