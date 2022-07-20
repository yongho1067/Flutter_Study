import 'package:get/state_manager.dart';

import 'doll.dart';

// dart 언어의 List
// 고정길이 리스트 var aa= new List(10);
// 가변길이 리스트 var aa= new List();
//              var aa = [100,200,300,400,500];
// aa[0]=50; // o
// print(aa[0]) // o
// reduce() 메소드 // aa에서 bb만큼 빼라
// ㄴ aa.reduce((aa,bb) => aa +=bb);



// cart_getx.dart
class SCartController extends GetxController{
  // web에서 session처럼
  // 여기서는 주문총액, 장바구니에 보이는 갯수
  RxList <dynamic> scart = [].obs; // scart는 앞에 선언처럼 List // obs: observer
  // rx ==> reactivex , 반응형x : 값이 변경되면 거기에 따라 결과가 반영된다.
  int get count => scart.length;
  // fold에서는 초기치를 앞에 써야함 (즉, hap시작값), reduce는 시작값 생략
  int get tothap =>
      scart.fold(0, (hap, aaa) => hap + aaa.dollprice as int); // 여기서 aaa는 현재 요소
  // List의 fold와 reduce
  // List <int> alist=[0,10,20,30];
  // int tot = alist.fold(0,(hap,amoo)=>hap+amoo);
  // 진행과정 : 0+0=>0 0+10=>10 10+20=>30 30+30=>60

  // ------------------------------------------------------

  Cartro(Doll doll){  // Cartro는 쇼핑카트에 넣자는 // 이건 user-defined
    scart.add(doll);  // aaa는 List에 내용넣기, 그러면 리스트에 갯수 증가 => count가 증가, tothap도 증가
                         // 변화 발생으로 인해 상태관리가 진행 될 수 있음
  }

   OutCart(Doll doll){ // OutCart는 쇼핑카트에서 빼자 // 이건 user-defined
    scart.remove(doll); // remove는 List에서 내용 빼기, 그러면 리스트에 갯수 감소 => count가 감소, tothap도 감소
                           // 변화발생으로 인해 상태관리가 진행 될 수 있음.
  }

}