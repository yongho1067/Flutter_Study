import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login example",
      home: Scaffold(
        body: Container(
          padding: // 좌 상 우 하
          EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: Column(
            children: [
              InkWell(
                child: Container(
                  height: 300,
                    width: 300,
                    child:
                    Image.asset('images/space.jpg', fit: BoxFit.cover), // 원본 그대로 출력
                ),
                onTap: (){
                  print('우주');
                },
              ),
              SizedBox(height: 45.0,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: "your_email@naver.com",
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 15.0,),
              TextFormField(
                initialValue: "Your Password",
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height:10.0 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Log In"),
                    onPressed: (){},
                  ),
                  SizedBox(width: 10.0,),
                  RaisedButton(
                      child: Text("Cancel"),
                      onPressed: (){}
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}



