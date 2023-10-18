//套件包
//import 放入 輸入
//pubspec.yaml
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget customCard(double maxWid) {
    return Container(
      margin: EdgeInsets.all(10),
      width: maxWid * 0.85,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2, // 4/8
              child: Container(
                height: 100,
                color: Colors.grey,
              )),
          Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.blueGrey,
              )),
          Expanded(
              flex: 2,
              child: Container(
                height: 100,
                color: Colors.black26,
              )),
        ],
      ),
    );
  }

  // main -> runApp -> MaterialApp -> Scaffold -> AppBar body BottomNavigatorBar
  @override
  Widget build(BuildContext context) {
    //區域變數
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 219, 203),
      appBar: AppBar(title: const Center(child: Text('登入頁面'))),
      body: LayoutBuilder(builder: (context, box) {
        double maxWid = box.maxWidth;
        double maxht = box.maxHeight;
        return Container(
          width: maxWid,
          height: maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customCard(maxWid),
              customCard(maxWid),
              customCard(maxWid),
              customCard(maxWid),
              customCard(maxWid),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        items: bottomBarItems,
        onTap: onItemChange,
      ),
    );
  }
}
