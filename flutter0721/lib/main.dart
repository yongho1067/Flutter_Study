import 'package:flutter/material.dart';
import 'package:flutter0721/view/SawonView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 비동기 처리 (async, await)가 있는 경우 또는 binding을 초기화(widget binding 미리처리)하고 runApp 해야할 경우.
  // widget binding : widget tree를 flutter engine에 연결

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'SQL',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: sawonView()
      ,
    );
  }
}


