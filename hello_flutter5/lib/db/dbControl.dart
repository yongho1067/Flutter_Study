import 'package:hello_flutter5/db/dbDAO.dart';
import 'package:hello_flutter5/db/sawonVO.dart';

class DBControll {
  Future<List<Sawon>> getEmps() async{
    final sawonList = await DatabaseHelper.getSawons("sawont");
    return sawonList.map((item) => Sawon(
        id: item["id"] as String,
        irum: item['irum'] as String,
        tel : item["tel"] as String)).toList();
  }

  void insertEmp(String irum, String tel){
    DatabaseHelper.insertSawon(
        "sawont", {"id": DateTime.now().toString, "irum": irum, "tel":tel});
    // 테이블명, data를 받는다
  }

  void updateEmp(String id, String irum, String tel){
    DatabaseHelper.updateSawon(
        "sawont", id, {"id": DateTime.now().toString,"irum":irum, "tel":tel});
  }

  void deleteEmp(String id){
    DatabaseHelper.deleteSawon("sawont", id);
  }


}