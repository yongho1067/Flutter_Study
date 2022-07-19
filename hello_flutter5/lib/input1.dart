import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

// keyboard 입력이 가능하도록 해보세요(단, TextField사용)

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "input example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("입력 키보드"),
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            labelText: "입력 해 주세요.",
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}





