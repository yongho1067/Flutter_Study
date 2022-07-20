// kajashop_getx.dart
import 'dart:ui';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'doll.dart';

class KajaShopController extends GetxController{ // pub.dev example 처럼 클래스 선언 한 것
  // var aa = List <> ().obs;
  RxList<dynamic> dolls = [].obs;
  
  @override
  void onInit(){ // pub.dev example에 나온 메소드임
    super.onInit();
    viewDolls();
  }

  void viewDolls() async{
    await Future.delayed(Duration(seconds:1)); // 2초면 너무길다
    var dollList = [ // 대괄호이므로 현재 list 설정중
      Doll(
      dollnum:11,
      dollimage: 'https://cdn.pixabay.com/photo/2013/07/13/01/24/bunny-155674_960_720.png',
      dollname: '토끼인형',
      dollexplain: '귀여운 토끼 인형',
      dollprice: 3000,
      ),
      Doll(
        dollnum:22,
        dollimage: 'https://cdn.pixabay.com/photo/2013/07/13/13/41/bear-161397_960_720.png',
        dollname: '곰인형',
        dollexplain: '귀여운 곰 인형',
        dollprice: 4000,
      ),
      Doll(
        dollnum:33,
        dollimage: 'https://cdn.pixabay.com/photo/2016/10/27/09/26/fox-1773727_960_720.png',
        dollname: '여우인형',
        dollexplain: '귀여운 여우 인형',
        dollprice: 5000,
      ),
      Doll(
        dollnum:44,
        dollimage: 'https://cdn.pixabay.com/photo/2014/04/03/10/46/panda-311376_960_720.png',
        dollname: '판다인형',
        dollexplain: '귀여운 판다 인형',
        dollprice: 2000,
      ),
    ]; // list-end

    dolls.value = dollList; //반드시 꼭 .value 써야함

    ///
  }
}