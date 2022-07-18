import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가자 버튼',
      // 테마
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(title:Text('버튼 타이틀')),
              body: Column(
                children: [
                  RaisedButton(
                    onPressed: (){
                      print('나 RaisedButton 이야');
                    },
                    child: Text("눌러봐"),
                  )
                ],
              )
          )
      ),
    );
  }
}

// 버튼 종류
// 1.x -2.x 초반 FlatButton, RaisedBotton, OutlineButton
// 2.x 초반      TextButton, ElevatedButton , OutlineButton

// custom button : InkWelli