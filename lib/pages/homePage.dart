import 'package:flutter/material.dart';
import 'package:tutorial/tool/pub.dart'; //絕對路徑

// import './tool/pub.dart'; //相對路徑
//動態
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //資料區域
  int _counter = 0;
  //是否初始化完畢
  bool isInitializing = false;
  Map<String, dynamic> profile = {};
  //初始化 override覆寫:他會覆寫 他繼承父類(StatefulWidget) -> initState父類的功能
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  //功能
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //初始化取資料
  getData() {
    //拿資料 api
    profile = {"name": "Tsai", "sender": 1, "age": 27};
    isInitializing = false;
  }

  //取屬性
  getColumnVal(profileName columnName) {
    switch (columnName) {
      case profileName.age:
        return profile[profileName.name.name];
      case profileName.sender:
        return profile[profileName.sender.name];
      case _:
        return profile[profileName.age.name];
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //畫面建立
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: isInitializing
          ? CircularProgressIndicator()
          : LayoutBuilder(builder: (context, box) {
              double maxheight = box.maxHeight;
              double maxWidth = box.maxWidth;
              return Container(
                width: maxWidth,
                height: maxheight,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 50,
                      color: Colors.blue,
                    )
                  ],
                ),
              );
            }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
