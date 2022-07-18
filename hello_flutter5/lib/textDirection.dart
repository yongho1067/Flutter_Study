import 'package:flutter/material.dart';

void main(){

  runApp(
    //widget tree의 root는 runApp(앱을 실행하는)
    Center(
      //Center 위젯 // 화면 가운데
      child: Text(
        //Text 위젯
        "안녕 아자아자 파이팅", // Text 내용
        textDirection: TextDirection.ltr, // 텍스트는 left to rigt 방향
        overflow: TextOverflow.ellipsis,
        // overflow : TextOverflow.ellipsis, 긴글자일때..으로 표시
        style: TextStyle(
          // color : Colors,amber 기본색정하기
          color: Color(0xff00FF00), // 더 많은 색 정하기 00FF00이므로 글씨는 green
          backgroundColor: Color(0xff0000FF), // 0000FF = blue
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
    ),
  );

}