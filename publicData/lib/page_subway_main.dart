import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicdata/subway_demo.dart';
import 'dart:convert';

//공공데이터를 가져와서 광화문역을 처리하는 url
const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String _userKey = 'sample';
const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
const String _defaultStation = '광화문';

const int STATUS_OK = 200; //상태는 정상으로 처리

//전에(0721subway.dart)는 url에서 json 형식을 출력하는 위주라면
//이것은 특정 역을 지정하여 그 역에 대한 정보를 사용 가능하도록 정확하게 출력하는 것이 목적
//stf 하고 tab 누르고 MainPage 입력으로 만드는 것
class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class SubwayArrival {

  //아래 변수명들은 지정한 key이므로 변경하면 안 됨
  int _rowNum;
  String _subwayId; // 지하철 호선
  String _trainLineNm;  // 도착지 방면
  String _subwayHeading; // 내리는 문 방향
  String _arvlMsg2; //이것은 몇 분 후에 도착할 것인지에 대한 것


  //생성자
  SubwayArrival(this._rowNum, this._subwayId, this._trainLineNm,
      this._subwayHeading, this._arvlMsg2);

  int get rowNum => _rowNum;
  String get subwayId => _subwayId;
  String get trainLineNm => _trainLineNm;
  String get subwayHeading => _subwayHeading;
  String get arvlMsg2 => _arvlMsg2;
}







class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}