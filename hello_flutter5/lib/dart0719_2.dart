import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//이미지 자동 반복기능
//swiper 플로그인은 pub.dev에서 flutter_swiper로 ㄱ머색 후
//install로 가면 방법이 나온다

void main() {
  runApp(const MyApp()); //기본 main.dart를 활용한 것
}

//keyboard 입력이 가능하도록 하시오 (단, TextField 사용)
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter swiper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Swiper'),
    );
  }
}

class MyHomePage extends StatefulWidget {//계속 reapint 즉, rebuild 해야 하므로
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> imgList = [//이미지 url
    //pixabay
    'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/07/31/00/30/vw-beetle-405876_1280.jpg',
    'https://cdn.pixabay.com/photo/2013/07/13/11/27/car-158202_1280.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('go swiper'),
        ),
        body: Container(
          height:250,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Swiper(
              //Swiper의 4가지 구성
                control: SwiperControl(), //1) 이미지 케어
                pagination: SwiperPagination(), //2) 페이지 메기기
                itemCount: imgList.length, //3) 이미지 개수
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(imgList[index]); //4) 이미지 출력방식
                }),
          ),
        ));
  }
}