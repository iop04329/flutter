import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登入頁面')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Text('User ID'),
      ),
    );
  }
}
