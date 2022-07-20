import 'package:flutter/material.dart';
import 'package:hello_flutter5/0720/cart_getx.dart';
import 'package:get/get.dart';
import 'package:hello_flutter5/0720/kajashop_getx.dart';
import 'package:hello_flutter5/0720/cart_getx.dart';
import 'package:hello_flutter5/0720/kajashop_getx.dart';

class Kajashopping extends StatelessWidget { 
  // main()의 Kajashopping() 때문에 여기로 옴
  // 쇼핑카트, doll에 대한 상태는 따로 만들어 놓음
  final kajaShopController = Get.put(KajaShopController());
  // new KajaShopController() 개념이므로 Get.put은 여기서 해당 컨트롤러를 메모리에 올리고 나올때 종료됨.
  // 즉, page가 이동되어도 인스턴스 자동 생성
  final scartController = Get.put(SCartController());
        // scartController 는 아래에서 반드시 나옴.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // child column, row 영역을 꽉 채우라는 것
              child: GetX<KajaShopController>(
                // 참고 : abx() , Get.find
                // KajaShopController : Get.put으로 받은 것, GetX(대문자 시작)
                builder: (controller){ // doll controller
                  return ListView.builder(
                    itemCount: controller.dolls.length, //4  //  dolls 갯수만큼 다 view
                    itemBuilder: (context,index){
                      return Card(
                        // listview + card는 짝꿍
                        margin: const EdgeInsets.all(10),
                        child : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end, // start
                              children: [
                                Row(
                                  mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          // dolls는 리스트이므로 index번째 사용가능
                                          controller.dolls[index].dollimage,
                                          // Get.put으로 넘어온
                                          width: 200,
                                          height: 100),
                                        Text(
                                          '${controller.dolls[index].dollname}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          '${controller.dolls[index].dollexplain}'),
                                        Text(
                                          '${controller.dolls[index].dollprice}원',
                                          style: TextStyle(fontSize: 15)),
                                      ],
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    // 메모리에 올라오게 된 소문자로 시작하는 scartController
                                    // 즉,web에서 new DAO DAO객체.메소드()
                                    scartController.Cartro(
                                      controller.dolls[index]); // dolls=[].abs
                                    // .fole(전의 hap에다 지금 금액을 합하여 tothap에다 넣는 작업
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(
                                        // MaterialStateProperty.all ==> 한가지 스타일로 적용하겠다
                                    Colors.amber,
                                      ),
                                    ),
                                  child: Text('장바구니'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: (){
                                    scartController.OutCart( // 취소
                                      controller.dolls[index]);
                                    // list의 메소드의 .remove , 앞에서는 hap을 더해서 tothap
                                    // 여기서는 hap을 빼서 tothap
                                    // 원래 .fold는 하나만
                                  },
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                      // MaterialStateProperty.all ==> 한가지 스타일로 적용하겠다는 것
                                      Colors.pink,
                                    ),
                                  ),
                                  child: Text('장바구니 취소'),
                                )
                              ],

                            )
                          )
                        )
                      );
                    },
                  );
                },
              ),
            ),
            GetX<SCartController>(builder: (controller){ // 주문 총액을 해결
              return Text(
                '주문 총액 : ${controller.tothap}원',
                style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
              );
            }),
            SizedBox(height: 50),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended( // 카트아이콘 + 레이블
        onPressed: (){},
          backgroundColor : Colors.orange,
          icon: Icon( // 아이콘
            Icons.add_shopping_cart,
            color: Colors.blueAccent,
          ),
        label: GetX<SCartController>(builder: (controller){ // 레이블
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 15),
          );
        }),
      ),
    );
  }
}
