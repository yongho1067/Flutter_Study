
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override // 상태
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _title = '버튼 타이틀';

  //setState()==> Bloc(대규모) ==> provider(중소규모)
  // ==> getx

  // on off toggle
  String _bstate = 'off';

  //onpressd
  void onClick() { // 메소드 정의문 LCLJ Like C Like Java
    print('onclick');
    setState(() {
      //state management 변화가 있으면 작동
      if (_bstate == 'off') {
        _bstate = 'on';
      } else {
        _bstate = 'off';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ohye',
        home: Scaffold(
            appBar: AppBar(title:Text('ohye')),
            body:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(child: Text("사각버튼"), onPressed: onClick), //onClick ==> 메소드 호출문
                Text("$_bstate"),

                RaisedButton(child: Text("둥근버튼"), onPressed: onClick, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                )),

                FlatButton(child: Text("플랫버튼"), onPressed:(){print("flat");},color: Colors.green),

                ElevatedButton(child: Text("엘리버튼"), onPressed:(){print("ele");}),

                TextButton(child: Text("텍스트버튼"), onPressed:(){print("text");}),

                GestureDetector(
                  onTap: (){
                    print("클릭");
                  },
                  onDoubleTap: (){
                    print("더블클릭");
                  },
                  onLongPress: (){
                    print("Long Press");
                  },
                  child: Container(
                    color: Colors.pink,
                    height: 100,
                    child: Text("제스터 버튼")
                  ),
                ),

                InkWell( // onTap, onDoubleTap 만 가능
                  onTap: (){
                    print("클릭");
                  },
                    child: Container(
                      color: Colors.amber,
                        height: 100,
                        child: Text("inkwell 버튼")
                    )
                )
              ],
            )
        )
    );
  }
}