import 'package:flutter/material.dart';


void main() {
runApp(MyApp());
}


class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'title',
theme: ThemeData(
primarySwatch: Colors.purple,
),
home: MyHomePage(),
);
}
}

class MyHomePage extends StatelessWidget {
const MyHomePage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
/*
        floatingActionButton: FloatingActionButton(
          child: Text('안녕'),
          onPressed: (){},
        ),
        */

appBar: AppBar(title: Text('안녕'),),
body: Center(
child: TextField(
decoration: InputDecoration(
labelText: '안녕',
),
),
)
);
}
}