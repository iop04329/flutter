//套件包
//import 放入 輸入
//pubspec.yaml
import 'package:flutter/material.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  int selectedIndex = 0; //所選的索引值
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: village',
      style: optionStyle,
    ),
    Text(
      'Index 4: sunny',
      style: optionStyle,
    ),
  ];
  //底下的底部導航的項目
  List<BottomNavigationBarItem> bottomBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'School',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.holiday_village),
      label: 'village',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sunny),
      label: 'sunny',
    ),
  ];

  void onItemChange(int index) {
    //setState loginPage畫面刷新
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //區域變數
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('登入頁面'))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        child: Center(child: widgetOptions[selectedIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        items: bottomBarItems,
        onTap: onItemChange,
      ),
    );
  }
}
