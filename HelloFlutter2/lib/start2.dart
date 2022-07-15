import 'package:flutter/material.dart';
import 'package:helloflutter2/main.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Title', //어플이름
      home: Scaffold(
        appBar: AppBar(title: Text("AppBar Title")),
        body: Text("Body")
      ),
    );
  }
}
