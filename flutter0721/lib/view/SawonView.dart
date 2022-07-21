import 'package:flutter/material.dart';
import 'package:flutter0721/control/dbControl.dart';

import '../model/dto.dart';

class sawonView extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  @override
  _sawonViewState createState() => _sawonViewState();
}

class _sawonViewState extends State<sawonView> {
  @override
  final TextEditingController _irumController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final dbcontrol = DBcontroll();

  void showBottomModal(
    // 배경을 가리면서 시트가 보여지는 기능
    BuildContext context2, String id, String irum, String tel) {
    final TextEditingController _updateIrumController = TextEditingController();
    final TextEditingController _updateTelController = TextEditingController();
    _updateIrumController.text = irum;
    _updateTelController.text = tel;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context2,
      builder: (_) { // BiuildContext context){ }의 생략형, '_' 은 "이것 사용안함" 의 뜻
        return Container (
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20 ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                Padding(
                  padding:
                    const EdgeInsets.only(top:20, left:20, right: 20),
                  child: TextField(
                    //https://stackoverflow.com/questions/54661567/what-is-the-difference-between-textformfield-and-textfield
                    //텍스트 폼필드는 유효성검사가 가능하다.
                    controller: _updateIrumController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'irum'
                    ),
                  ),
                ) ,
                Padding(
                  padding:
                    const EdgeInsets.only(top:20, left:20, right: 20),
                  child: TextField(
                    controller: _updateTelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'tel'
                    ),
                  ),
                ) ,
                Padding(
                  padding:
                    const EdgeInsets.only(top:20, left:20, right: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        dbcontrol.updateEmp(
                          id,
                          _updateIrumController.text,
                          _updateTelController.text
                        );
                      });
                      Navigator.of(context2).pop();
                    },
                    icon: Icon(Icons.edit),
                    label: Text('수정된 사원정보 저장'),
                  ),
                )
              ],
            ),
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사원 관리 북'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget> [
            Padding (
              padding: const EdgeInsets.only(top:20, left:20, right: 20),
              child: TextField(
                controller: _irumController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'irum'),

              ),
            ),
            Padding (
              padding: const EdgeInsets.only(top:20, left:20, right: 20),
              child: TextField(
                controller: _telController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'tel'),
              ),
            ),
            Padding (
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // 사원 추가 아이콘 색
                ),
                onPressed: (){
                  setState(() {
                    //상태 관리
                    dbcontrol.insertEmp(
                      _irumController.text,
                      _telController.text);
                  });
                  // 변화 발생시 두이름과 전화번호를 인자로하여 insertEmp() 호출
                  _irumController.clear(); // insert 후 남아있는 값 초기화
                  _telController.clear();
                },
                icon: Icon(Icons.add),
                label: Text('사원 추가'),
              ),
            ),

            // 비동기
            // db date를 get하기전에 미리 화면 출력
            // (1) Future .... delay...
            // (2) FutureBuilder 사용 : 위 기능을 수행
            Expanded(
              child: FutureBuilder(
                future: dbcontrol.getEmps(),
                builder: (context3, snap) {
                  List<Sawon> sawonList = snap.data as List<Sawon>;
                  if(!snap.hasData){
                    return Center(
                      child: Text('자료 없음'),
                    );
                  }
                  return ListView.builder( // data가 get 되면 바로 출력
                    itemCount: sawonList.length,
                    itemBuilder: (context3, idx) {
                      return Card(
                        elevation: 3,
                        child: ListTile(
                          // ListView + Card + ListTile은 3짝꿍
                          // 즉, 스크롤 + 라운드 그림자 +하나씩 분류
                          title: Text('${sawonList[idx].irum}'),
                          subtitle: Text('${sawonList[idx].tel}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget> [
                              IconButton(
                                icon:Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    dbcontrol.deleteEmp(sawonList[idx].id);
                                  });
                                }
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () => showBottomModal(
                                  // 에디트 아이콘을 여기서 누르면 메소드 호출문 처럼 작성되어 있는데
                                  // showBottomModal()은 위의 showbottomModal() 정의문을 호출
                                  context3,
                                  sawonList[idx].id,
                                  sawonList[idx].irum,
                                  sawonList[idx].tel,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
