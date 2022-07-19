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
              //Swiper의 추가 구성
                autoplay: true, //이미지를 자동으로 넘긴다
                scale: 0.5, //이미지 겹침 (클수록 많이)
                viewportFraction: 0.8, //전체적인 크기
                pagination: SwiperPagination(
                    alignment: Alignment.bottomRight //처음이 아래 오른쪽으로
                ),
                itemCount: imgList.length, //이미지 갯수
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(imgList[index]); //이미지 출력방식
                }),
          ),
        ));
  }
}
