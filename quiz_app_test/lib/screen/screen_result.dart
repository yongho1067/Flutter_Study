import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_home.dart';
class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;
  List<int>mbtiScore = [0,0,0,0,0,0,0,0,0,0,0,0];
  int mbtiE = 0;
  int mbtiI = 0;
  int mbtiN = 0;
  int mbtiS = 0;
  int mbtiT = 0;
  int mbtiF = 0;
  int mbtiP = 0;
  int mbtiJ = 0;
  List<String> mbti = ["", "", "", ""];
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

    for(int i = 0; i < quizs.length; i++){
      if(quizs[i].answer == answers[i]){
        mbtiScore[i] += 1;
      }else{
        mbtiScore[i] -= 1;
      }
    }

    mbtiE = mbtiScore[0] + mbtiScore[1];
    mbtiI = mbtiScore[2];
    mbtiN = mbtiScore[3] + mbtiScore[5];
    mbtiS = mbtiScore[4];
    mbtiT = mbtiScore[6];
    mbtiF = mbtiScore[7] + mbtiScore[8];
    mbtiP = mbtiScore[9];
    mbtiJ = mbtiScore[10] + mbtiScore[11];

    if(mbtiE > mbtiI){
      mbti[0] = "E";
    }else{
      mbti[0] = "I";
    }

    if(mbtiS > mbtiN){
      mbti[1] = "S";
    }else{
      mbti[1] = "N";
    }

    if(mbtiT > mbtiF){
      mbti[2] = "T";
    }else{
      mbti[2] = "F";
    }

    if(mbtiP > mbtiJ){
      mbti[3] = "P";
    }else{
      mbti[3] = "J";
    }

    print(mbti);

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
                              fontSize: width * 0.040,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text("당신의 MBTI 결과는",
                          style: TextStyle(
                          fontSize: width * 0.053,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(

                          ),
                        ),
                        Text(mbti[0]+mbti[1]+mbti[2]+mbti[3],
                        style: TextStyle(
                          fontSize: width * 0.20,
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
                        child: Text("상세 결과 보기"),
                        color: Colors.white,
                        textColor: Colors.blueAccent,
                      ),
                    ),
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
                  ),
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
