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
      "title" : "단체활동에 참여하는 것을 즐기는 편이다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({  // TODO => E 적인 질문 (O/X)
      "title" : "친구들과 약속을 잡을때 둘보단 셋이 좋다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({  // TODO => I 적인 질문 (O/X)
      "title" : "다른 사람보다는 혼자의 시간을 보내고 싶어한다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => N 적인 질문 (O/X)
      "title" : "결말을 자신의 방식으로 해석할 수 있는 책과 영화를 좋아한다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => S 적인 질문 (O/X)
      "title" : "\"만약에~\" 라는 질문에 대해 깊게 생각하는 일은 시간 낭비라고 생각한다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => N 적인 질문 (O/X)
      "title" : "현재의 성과보다는 미래의 비전을 더 중요하게 생각한다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => T 적인 질문 (O/X)
      "title" : "감정보다는 이성을 따르는 편이다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => F 적인 질문 (O/X)
      "title" : "자신과 배경이 완전히 다른 사람에게도 쉽게 공감할 수 있다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => F 적인 질문 (O/X)
      "title" : "어떤 문제가 발생하면 문제해결보다는 공감이 우선이다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => P 적인 질문 (O/X)
      "title" : "내일 입을 옷은 내일 정하는 편이다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => J 적인 질문 (O/X)
      "title" : "계획에 차질이 생기면 빠르게 다른 대안을 만들어 차질이 없게 한다.",
      "candidates" : ["O","X"],
      "answer" : 0
    }),
    Quiz.fromMap({ // TODO => J 적인 질문 (O/X)
      "title" : "이미 내린 결정에 대해서는 다시 생각하지 않는 편이다.",
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
