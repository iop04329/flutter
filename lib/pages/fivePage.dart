import 'package:flutter/material.dart';

class fivePage extends StatefulWidget {
  fivePage(this.text, {super.key});
  String text;

  @override
  State<fivePage> createState() => _fivePageState();
}

class _fivePageState extends State<fivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第五頁"),
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
