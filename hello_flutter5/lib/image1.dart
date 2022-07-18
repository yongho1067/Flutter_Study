import 'package:flutter/material.dart';
import 'package:hello_flutter5/view/space_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '이미지 플러터1',
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.photo_camera),
            title: Text('이미지 플러터2'),
            actions: [
              IconButton(
                  icon: Icon(Icons.photo_album),
                  tooltip: "이미지 플러터3",
                  onPressed: () => {}
              )
            ],

          ),
          body: SpaceImage(), // 이걸 참조하여 dart 파일을 만들어 st1 자동완성등을 시작
      ),
    );
  }
}

// 여기서 부터 새로운 dart 파일로
// 필요시 폴더 사용 ( model, control, view)
