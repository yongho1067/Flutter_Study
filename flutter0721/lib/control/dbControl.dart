import 'package:flutter0721/model/dbDAO.dart';
import '../model/dto.dart';

class DBcontroll {
  Future <List<Sawon>> getEmps() async { // 비동기
    final sawonsList = await DatabaseHelper.getSawons('sawont');
    return sawonsList
      .map((item) => Sawon(
        id: item['id'] as String,
        irum: item['irum'] as String,
        tel: item['tel'] as String
      ))
      .toList();
  }


  void insertEmp(String irum, String tel) {
    DatabaseHelper.insertSawon(
      'sawont', {'id' : DateTime.now().toString(), 'irum': irum, 'tel': tel}
    );
    // 테이블명, data를 받는다
  }

  void updateEmp(String id, String irum, String tel) {
    DatabaseHelper.updateSawon('sawont', id,
      {'id' : DateTime.now().toString(), 'irum' : irum, 'tel' : tel}
    );
  }

  void deleteEmp(String id) {
    DatabaseHelper.deleteSawon('sawont', id);
  }


}

