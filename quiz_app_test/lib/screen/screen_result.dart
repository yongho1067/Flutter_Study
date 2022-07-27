import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_home.dart';

class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({ required this.answers, required this.quizs});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for (int i = 0; i < quizs.length; i++){
      if(quizs[i].answer == answers[i]){
        score += 1;
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("images/quiz_background3.jpg")
            ),
          ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
          body : Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blueAccent),
                color: Colors.blueAccent,
              ),
              width: width * 0.85,
              height: height * 0.5,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blueAccent),
                      color: Colors.white,
                    ),
                    width: width * 0.73,
                    height: height *0.25,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, width*0.048, 0, width*0.048),
                          child: Text(
                            "수고하셨습니다!",
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text("당신의 점수는",
                          style: TextStyle(
                          fontSize: width * 0.048,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(

                          ),
                        ),
                        Text(score.toString()+"/"+ quizs.length.toString(),
                        style: TextStyle(
                          fontSize: width * 0.21,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width*0.012),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                    child: ButtonTheme(
                      minWidth: width * 0.73,
                      height: height * 0.05,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (cotext){
                            return HomeScreen();
                          }));
                        },
                        child: Text("홈으로 돌아가기"),
                        color: Colors.white,
                        textColor: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
      )
    );
  }
}
