import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_flutter5/bottomnavibar_exam.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SafeArea(
        child : Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text("안녕하세요", style: TextStyle(color: Colors.white, backgroundColor: Colors.black,
                  fontSize: 24, fontWeight: FontWeight.bold)),
              Text("안녕하세요", style: TextStyle(color: Colors.white, backgroundColor: Colors.black,
                  fontSize: 24, fontWeight: FontWeight.bold)),
              Text("안녕하세요", style: TextStyle(color: Colors.white, backgroundColor: Colors.black,
                  fontSize: 24, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

/*
* spacer() --> Row 또는 column 과 같은 flex 공간에서 위젯과 위젯 사이의 공간을
* 조정하는데 사용 함
* [위젯]     [위젯][위젯] 이런식으로 사용할수있음
* https://youtu.be/7FJgd7QN1zI
* */
