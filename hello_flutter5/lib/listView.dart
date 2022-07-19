import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "List View Example";

  static const List<String> _data = [
    "수성",
    "금성",
    "지구",
    "화성",
    "목성",
    "토성",
    "천왕성",
    "해왕성",
    "명왕성"
  ];

  Widget _buildStaticListView() {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (BuildContext _context, int i) {
        return ListTile(
          title: Text(_data[i],
              style: TextStyle(
                fontSize: 23,
              )),
          trailing: Icon(Icons.favorite_border),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: _buildStaticListView(),
        )
    );
  }
}
