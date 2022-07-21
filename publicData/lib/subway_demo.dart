import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(SubwayDemo());

// 공공 api 연동 및 화며에 출력하는 예제
// 말그대로 화면에 쭉 나옴
class SubwayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 실시간 정보',
      home: MainPage(),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  static const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
  static const String _userKey = 'sample';
  static const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
  static const String _defaultStation ='광화문'; // 이것은 무조건 디폴트로 '광화문' 으로 처리하겠다는 것

  String _response = ''; // 호출결과가 들어감

  String _buildUrl(String station){ // 역이름이 들어올 수 있는데
    StringBuffer sb = StringBuffer(); // url append
    sb.write(_urlPrefix);
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);
    return sb.toString();
  }

  // import 'package:http/http.dart' 에서 사용가능한 메소드가 get,post,put ....
  // 그러므로 coding 시 메소드 사용하려면
  // var response = await get(_buildUrl(_defaultStation));
  // 이렇게 할 경우 import 'package:http/http.dart' as http;
  // get을 사용하려면 http.get()
  // http.get() : 어떤 특정한 url을 get

  _httpGet(String url) async{
    // 언제 결과가 반환될지 모르므로 async
    var response = await http
        .get(_buildUrl(_defaultStation)); // http.get(http:...../광화문)/
    // 호출 결과 반환시까지 await
    //---------------------------------
    var statuscode = response.statusCode;
    // I/flutter (5082) : 200
    print('${statuscode}');
    var headers = response.headers;
    //I/flutter ( 5082): {set-cookie: WMONID=zWpnK9EgEZl;
    // Expires=Fri, 21-Jul-2023 16:05:27 GMT; Path=/,
    // date: Thu, 21 Jul 2022 07:05:27 GMT,
    // access-control-allow-origin: *,
    // transfer-encoding: chunked, content-encoding: gzip,
    // vary: Accept-Encoding, content-type:
    // application/json;charset=utf-8,
    // server: Apache/2.2.26 (Red Hat Enterprise Web Server)}
    print('${headers}');
    // --------------------------------
    // var responsebody = response.body;
    var responsebody2 = utf8.decode(response.bodyBytes);
    print('${responsebody2}');
    // --------------------------------
    String res = response.body;
    print('res >> $res');
    //I/flutter ( 5082): res >> {"errorMessage":
    // {"status":200,"code":"INFO-000","message":"정상 처리되었습니다.",
    // "link":"","developerMessage":"","total":3},
    setState((){ // 상태관리
      // 결과가 나오면 위젯 갱신
      _response = res;
    });
  }

  @override
  void initState(){
    super.initState();
    _httpGet(_buildUrl(_defaultStation)); // 광화문으로 처리
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('지하철 실시간 정보'),
        ),
        body: Center(
          child: Text(_response), // http으답 그대로 출력
        )
    );
  }
}