import 'package:flutter/material.dart';

class fourPage extends StatefulWidget {
  fourPage(this.text, {super.key});
  String text;

  @override
  State<fourPage> createState() => _fourPageState();
}

class _fourPageState extends State<fourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第四頁"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(widget.text),
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
