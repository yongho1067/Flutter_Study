import 'package:flutter/material.dart';
import 'kajashopping.dart';

void main() {
  runApp(MyApp());
}
/* ----------------------------------------

 getx
   ㄴ route
   ㄴ state management(getxcontroller, .obs, obx(), rxint, rxdouble ...... )


 ---------------------------------------- */
// no name... 같은 에러가 나면 pub.dev 에서
// get 찾아서
// 최신버전으로 pubspec.yaml에 넣으면 됨

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Kajashopping(),
    );
  }
}

