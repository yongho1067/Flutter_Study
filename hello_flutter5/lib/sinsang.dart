import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter5/ewol.dart';
import 'package:hello_flutter5/meaJang.dart';
import 'package:hello_flutter5/shoppingHome.dart';

void main(){
  runApp(Sinsang());
}

class Sinsang extends StatelessWidget {
  const Sinsang ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("신상코너"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
                'https://cdn.pixabay.com/photo/2013/07/12/19/00/polo-shirt-154158_1280.png'),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                child: Text("이월 상품"),
                onPressed: (){
                  Get.to(() => Ewol());
                },
              ),
              ElevatedButton(
                child: Text("쇼핑몰 홈으로"),
                onPressed: (){
                  Get.to(() => ShoppingHome());
                },
              ),
              ElevatedButton(
                child: Text("매장안내"),
                onPressed: (){
                  Get.to(() => MeaJang());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

