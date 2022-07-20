
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //(1) 이것 추가
  // WHY? 비동기 처리(anync, await)가 있는 경우 or binding 을 초기화(widget binding 미리처리) 하고
  // runApp 해야할 경우
  // widget binding : widget tree를 flutter engine 에 연결
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
/*      home: (),*/
    );
  }
}
