import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//靜態
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
//動態
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//列舉
enum profileName {
  name,
  sender,
  age,
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //是否初始化完畢
  bool isInitializing = false;
  Map<String,dynamic> profile = {};
  //功能
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  //初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }
  //初始化取資料
  getData(){
    //拿資料 api
    profile = {"name":"Tsai","sender":1,"age":27};
    isInitializing = true;
  }
  getColumnVal(profileName columnName){
    switch (columnName) {
      case profileName.age:
        return profile[profileName.name.name];
      case profileName.sender:
        return profile[profileName.sender.name];
      case _:
        return profile[profileName.age.name];
    }
  }
  //
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
        title: Text(widget.title),
      ),
      body: isInitializing ? CircularProgressIndicator():Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(getColumnVal(profileName.name)),
            Text(profile[profileName.sender.name].toString()),
            Text(profile[profileName.sender.name].toString()),
            Text(profile[profileName.sender.name].toString()),
            Text(profile[profileName.sender.name].toString()),
            Text(profile[profileName.sender.name].toString()),
            Text(profile[profileName.sender.name].toString()),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
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
