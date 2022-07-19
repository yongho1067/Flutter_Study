import 'package:flutter/material.dart';

// tabbar tabview를 사용하여
// 앱바의 아이콘을 누르면 body에 텍스트 or 그림이 출력되는
// 플러터 프로그램을 작성하시오

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // (1)
      title: "flutter",
        theme: ThemeData( // (2)
          primarySwatch: Colors.amber,
        ),
      home: AppBarExample(), // (3)
    );
  }
}

class AppBarExample extends StatefulWidget {
  @override
  State<AppBarExample> createState() => _AppBarExampleState();
  // count 생각해서 ++ 만 되는 것으로 집중해버림
// 우리는 여기서 count는 하지 않음
}

class _AppBarExampleState extends State<AppBarExample> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar( // todo: 여기는 앱바 부분
            bottom: TabBar(
              //앱바의 하단
              tabs: [
                Tab(text: "app",icon: Icon(Icons.app_settings_alt)),
                Tab(text: "bike_scooter",icon: Icon(Icons.workspaces)),
                Tab(text: "android",icon: Icon(Icons.android)),
                Tab(text: "alarm",icon: Icon(Icons.alarm)),
                Tab(text: "music",icon: Icon(Icons.music_note)),
              ]
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Text("app")),
              Center(child: Text("bike_scooter")),
              Center(child: Text("android")),
              Center(child: Text("alarm")),
              Center(child: Text("music")),
            ],
          )
        )
    );
  }
}


