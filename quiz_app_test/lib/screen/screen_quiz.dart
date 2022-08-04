import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_result.dart';
import 'package:quiz_app_test/widget/widget_candidate.dart';

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
  'ios': 'ca-app-pub-3940256099942544/2934735716',
  'android': 'ca-app-pub-3940256099942544/6300978111',
}
    : {
  'ios': 'ca-app-pub-3940256099942544/2934735716',
  'android': 'ca-app-pub-3940256099942544/6300978111',
};



class QuizScreen extends StatefulWidget{
  List<Quiz> quizs;
  QuizScreen({required this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>{

  List<int> _answers = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
  List<bool> _answerState = [false, false, false, false];



  int _currentIndex = 0;
  SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.fullBanner,
      adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: AdRequest(),
    )..load();



    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.6), BlendMode.dstATop),
                    image: AssetImage("images/mbti_background.png")
                ),
              ),
              child: Column(
              children: [
                Center(
                  child: Container(
                    height: 100,
                    padding:EdgeInsets.fromLTRB(0, 0, 0, width*0.12),
                    child: AdWidget(
                      ad: banner,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.175,
                ),
                Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                width: width*0.9,
                height: height * 0.4,
                child: Swiper(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  loop: false,
                  itemCount: widget.quizs.length,
                  itemBuilder: (BuildContext context, int index){
                    return _buildQuizCard(widget.quizs[index], width, height);
                  },
                ),
              ),
            ]
            ),
          ),
          ),
        );

  }


  Widget _buildQuizCard(Quiz quiz, double width, double height){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, width*0.024, 0, width*0.024),
            child: Text("Q" + (_currentIndex + 1).toString() + ".", style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top:width*0.012) ,
            child: AutoSizeText(
              quiz.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.048,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Column(children: _buildCandidates(width, quiz),
          ),
          Container(
            padding: EdgeInsets.all(width*0.024),
            child: Center(
              child: ButtonTheme(
                minWidth: width*0.5,
                height:  height*0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: RaisedButton(
                  child: _currentIndex == widget.quizs.length - 1
                      ? Text("결과보기")
                      : Text("다음문항"),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: _answers[_currentIndex] == -1 ? null : () {
                      if (_currentIndex == widget.quizs.length - 1) {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                answers: _answers, quizs : widget.quizs)));
                      }else{
                        _answerState = [false, false, false, false];
                        _currentIndex += 1;
                        _controller.next();
                      }
                    },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCandidates(double width, Quiz quiz){
    List<Widget> _children = [];
    for (int i = 0; i < 2; i++){
      _children.add(
        CandWidget(
          index: i,
          text: quiz.candidates[i],
          width: width,
          answerState: _answerState[i],
          tap: (){
            setState(() {
              for (int j = 0; j < 2; j++){
                if (j == i){
                  _answerState[j] = true;
                  _answers[_currentIndex] = j;

                  print(_answers[_currentIndex]);
                }else{
                  _answerState[j] = false;
                }
              }
            });
          },
        ),
      );
      _children.add(
        Padding(
          padding: EdgeInsets.all(width*0.024),
        ),
      );
    }
    return _children;
  }
}