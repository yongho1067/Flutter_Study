import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_home.dart';

class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;
  List<int> mbtiEI = [0,0];
  List<int> mbtiSN = [0,0];
  List<int> mbtiTF = [0,0];
  List<int> mbtiPJ = [0,0];
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

    if(quizs[0].answer == 0){ //
      mbtiEI[0] += 1; // E 점수 1점 상승
    }else{
      mbtiEI[1] += 1; // I 점수 1점 상승
    }

    if(quizs[1].answer == 0){ //
      mbtiEI[0] += 1; // E 점수 1점 상승
    }else{
      mbtiEI[1] += 1; // I 점수 1점 상승
    }

    if(quizs[2].answer == 0){ //
      mbtiEI[1] += 1; // I 점수 1점 상승
    }else{
      mbtiEI[0] += 1; // E 점수 1점 상승
    }

    if(mbtiEI[0] > mbtiEI[1]){
      mbti[0] = "E";
    }else{
      mbti[0] = "I";
    }

    if(quizs[3].answer == 0){ //
      mbtiSN[1] += 1; // N 점수 1점 상승
    }else{
      mbtiSN[0] += 1; // S 점수 1점 상승
    }

    if(quizs[4].answer == 0){ //
      mbtiSN[0] += 1; // S 점수 1점 상승
    }else{
      mbtiSN[1] += 1; // N 점수 1점 상승
    }

    if(quizs[5].answer == 0){ //
      mbtiSN[1] += 1; // N 점수 1점 상승
    }else{
      mbtiSN[0] += 1; // S 점수 1점 상승
    }

    if(mbtiSN[0] > mbtiSN[1]){
      mbti[1] = "S";
    }else{
      mbti[1] = "N";
    }

    if(quizs[6].answer == 0){ //
      mbtiTF[0] += 1; // T 점수 1점 상승
    }else{
      mbtiTF[1] += 1; // F 점수 1점 상승
    }

    if(quizs[7].answer == 0){ //
      mbtiTF[1] += 1; // F 점수 1점 상승
    }else{
      mbtiTF[0] += 1; // T 점수 1점 상승
    }

    if(quizs[8].answer == 0){ //
      mbtiTF[1] += 1; // F 점수 1점 상승
    }else{
      mbtiTF[0] += 1; // T 점수 1점 상승
    }

    if(mbtiTF[0] > mbtiTF[1]){
      mbti[2] = "T";
    }else{
      mbti[2] = "F";
    }

    if(quizs[9].answer == 0){ //
      mbtiPJ[0] += 1; // P 점수 1점 상승
    }else{
      mbtiPJ[1] += 1; // J 점수 1점 상승
    }

    if(quizs[10].answer == 0){ //
      mbtiPJ[1] += 1; // J 점수 1점 상승
    }else{
      mbtiPJ[0] += 1; // P 점수 1점 상승
    }

    if(quizs[11].answer == 0){ //
      mbtiPJ[1] += 1; // J 점수 1점 상승
    }else{
      mbtiPJ[0] += 1; // P 점수 1점 상승
    }

    if(mbtiPJ[0] > mbtiPJ[1]){
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
