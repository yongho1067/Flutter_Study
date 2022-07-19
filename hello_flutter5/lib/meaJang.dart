import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter5/ewol.dart';
import 'package:hello_flutter5/shoppingHome.dart';
import 'package:hello_flutter5/sinsang.dart';


void main(){
  runApp(MeaJang());
}

class MeaJang extends StatelessWidget {
  const MeaJang ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("매장안내"),
        backgroundColor: Colors.black,
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
                child: Text("신상품으로"),
                onPressed: (){
                  Get.to(() => Sinsang());
                },
              ),
              ElevatedButton(
                child: Text("쇼핑몰 홈으로"),
                onPressed: (){
                  Get.to(() => ShoppingHome());
                },
              ),
              ElevatedButton(
                child: Text("이월 상품"),
                onPressed: (){
                  Get.to(() => Ewol());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

