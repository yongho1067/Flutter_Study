import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
//  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _title = '버튼 타이틀';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'img test',
        home: Scaffold(
            appBar: AppBar(
              title: Text('img+btn 연습해보자'),
            ),
            body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        color: Colors.pink,
                        height: 300,
                        width: 300,
                        child: Image.asset('images/space.jpg', fit: BoxFit.cover), // 원본 그대로 출력
                      ),
                      onTap: (){
                        print("Space");
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 300,
                        width: 300,
                        child:
                        Image.asset('images/space.jpg', fit: BoxFit.cover), // 원본 그대로 출력
                      ),
                      onTap: (){
                        print('우주');
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}