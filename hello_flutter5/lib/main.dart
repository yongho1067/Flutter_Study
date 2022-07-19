import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter5/meaJang.dart';

import 'package:hello_flutter5/shoppingHome.dart';
import 'package:hello_flutter5/sinsang.dart';
import 'package:hello_flutter5/ewol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        //List, <dynamic>
        GetPage(name: '/', page: () => const ShoppingHome()),
        // file 명은 shoppinghome.dart, class 명은 Shoppinghome
        GetPage(name: '/sinsang', page: () => Sinsang()),
        GetPage(name: '/ewol', page: () => Ewol()),
        GetPage(name: '/meaJang', page: () => MeaJang()),
      ],
    );
  }
}
