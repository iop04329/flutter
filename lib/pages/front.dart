import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class frontPage extends StatefulWidget {
  const frontPage({super.key});

  @override
  State<frontPage> createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
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
                '恭喜登入成功',
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
            ],
          ),
        ));
  }
}
