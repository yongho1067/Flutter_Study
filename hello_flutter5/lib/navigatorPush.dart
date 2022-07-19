import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  // context 명 상관없이 작성하기 ==============================
  _showNextPage(BuildContext context) => Navigator.push(
      // (2) 여기에서 push 로 NextPage로 이동
      context,
      MaterialPageRoute(builder: (context) => NextPage())); ////
  // ============================================================
  // 화면 전환 클래스

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Example"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _showNextPage(context), // (1) 이것 누르면 페이지 이동
          child: Text("다음 페이지로 이동"),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("다음 페이지"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _backToMainPage(context),
          child: Text("돌아가기"),
        ),
      ),
    );
  }
}

