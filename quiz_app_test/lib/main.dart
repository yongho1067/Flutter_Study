import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:quiz_app_test/screen/screen_home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  KakaoSdk.init(nativeAppKey: '608eb5fae3c3dace21b8c5ac3f8a4392'); // kakaosdk 초기화 (카카오 네이티브 앱키)

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'My Quiz App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

