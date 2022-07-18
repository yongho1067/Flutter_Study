import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "container 연습 ";

  /*const MyApp({Key? key}) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: Column(
            children: [
              Container(
                child: Text("나는 컨테이너"),
              ),
              Container(
                color: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                //안쪽 여백
                child: Container(color: Colors.amber, child: Text("나는 컨테이너2")),
              )
            ],
          ),
        ));
  }
}
