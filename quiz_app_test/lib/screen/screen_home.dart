import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({ // TODO => E 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({  // TODO => E 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({  // TODO => I 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => N 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => S 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => N 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => T 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => F 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => F 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => P 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => J 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => J 적인 질문 (O/X)
      "title" : "test",
      "candidates" : ["O","X"],
      "answer" : 0
    }),

  ];
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("간단한 MBTI 테스트 "),
            backgroundColor: Colors.blueAccent,
            leading: Container(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("images/mbti5.jpg", width: width * 0.8),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.024),
              ),
              Text(
                "간단한 MBTI 테스트 앱",
                style: TextStyle(
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "MBTI 테스트 전 안내사항 입니다.\n단순 재미를 위한 간단한 MBTI 테스트입니다.",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.048),
              ),
              _buildStep(width, "1. 총 테스트 문항은 12문항 입니다."),
              _buildStep(width, "2. 문항을 잘 읽고 본인의 대답을 고른뒤\n다음 문제 버튼을 눌러주세요."),
              _buildStep(width, "3. 친구들과 공유해서 각자의 결과를 확인해보아요!"),
              Padding(
                padding: EdgeInsets.all(width*0.048),
              ),
              Container(
                padding: EdgeInsets.only(bottom: width*0.036),
                child: Center(
                  child: ButtonTheme(
                    minWidth: width * 0.8,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: RaisedButton(
                      child: Text("지금 퀴즈 풀기",
                        style: TextStyle(color: Colors.white)
                      ),
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => QuizScreen(quizs: quizs)));
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _buildStep(double width, String title){
    return Container(
      padding: EdgeInsets.fromLTRB(
          width*0.048,
          width*0.024,
          width*0.048,
          width*0.024
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_box, size:width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width*0.024),
          ),
          Text(title),
        ],
      ),
    );

  }
}
