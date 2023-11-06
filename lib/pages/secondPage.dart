import 'package:flutter/material.dart';

class secondPage extends StatelessWidget {
  secondPage({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    print('我進來了');
    return Scaffold(
      appBar: AppBar(
        title: Text("第二頁"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () {
                  //返回值代表可攜帶東西回上一層 因為flutter每個頁面的參數傳遞非常麻煩
                  Navigator.pop(context, "我是返回值");
                },
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
