import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingHome extends StatelessWidget {
  const ShoppingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("쇼핑몰로 이예요"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("신상코너로 가자"),
          onPressed: (){
            Get.toNamed('/sinsang');
            //Get.off(()=>aaa()); //aaa로 가는데 이전 페이지는 삭제 후 이동
            //Get.offAll(()=>aaa()); //이전 페이지 모두 X
            //자바 get 방식으로 값을 가지고 간다
            //보내는 쪽에서는 Get.toNamed('/shinsang..?id=100&irum='hong');
            //받는 쪽에서는 Get.parameters['id'] Get.parameters['irum']

            //보내는 쪽에서 Get.toNamed('/shinsang',arguments: 'hong')
            //받는 쪽에서는 Text('${Get.arguments}')

            //보내는 쪽에서 Get.toNamed('/shinsang',arguments: {'id':100, 'irum':'hong'});
            //받는 쪽에서는 Text('${Get.arguments['id']   ${Get.arguments['irum']}')


          },
        ),
      ),
    );
  }
}
