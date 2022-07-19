// 이벤트 속성이 없는 텍스트나 이미지 처리를 위해
// gesturedetector 및 inkwell 을 작성하시오
// 그리고 snackbar 도 출력하시오 

import 'package:flutter/material.dart';

void main(){
  runApp(Mmapp());
}

class Mmapp extends StatelessWidget {
  const Mmapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('상단 제목 ')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 여기에 gesturedetecor 작성
          GestureDetector(
              onTap: (){
                print("Space is awesome");
              },
              child: Image.asset('images/space.jpg', width: 500, height: 200,)
          ),


          //====== 스낵바 ===========
          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap'))); // 이전버전

          //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ohye')));
          // -> 2.0 - 버전 이후
          // 일정 시간 이후 스낵바가 사라진다


          InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('SPACE'),
                duration:
                Duration(milliseconds: 1000), // seconds : 2 등등... // 1000ms 후에 사라짐
                // 실제 구현시 에러 문구나 확인 문구 용도로 사용 가능
                backgroundColor: Colors.pink,
              ));
              // print("Happy New Year");
            },
            child: Image.asset('images/space.jpg', width: 500, height: 200,),
          )

        ],
      ),
    );
  }
}