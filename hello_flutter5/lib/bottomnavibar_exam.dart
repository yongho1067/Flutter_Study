import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가자 플러터',
      home: Scaffold(
        appBar: AppBar(title: Text("응애 나 앱제목")),
        body: Center(child: Text("응애 나 내용부분"),
          ),
          //여기에 바텀을 만들어 보자
          bottomNavigationBar: BottomAppBar(
            child : SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //spaceEvenly : 시작과 끝 공간에 배치를 하지않고 모든 공간을 균등하게 배치한다
                // spaceAround : 시작과 끝 공간 (균등\2)만큼의 여유를 잡고 남은 공간을 균등하게 배치한다
                //spaceBetween : 시작과 끝에 배치 하고 나머지는 균등하게 배치한다
                children:[
                  Icon(Icons.photo),
                  Icon(Icons.cabin),
                  Icon(Icons.account_box_rounded),
                  Icon(Icons.clean_hands),
                  Icon(Icons.handyman),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
