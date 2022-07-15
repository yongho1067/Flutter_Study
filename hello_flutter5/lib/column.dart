import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가자 플러터',
      home: Scaffold(
          appBar: AppBar(title: const Text("응애 나 앱제목")),
          body: Column(
            children: const [
              Icon(Icons.android, color: Colors.amberAccent),
              Text("Hello Android"),
              Icon(Icons.email, color: Colors.blueAccent),
              Text("Sending an email"),
            ],
          )),
    );
  }
}
