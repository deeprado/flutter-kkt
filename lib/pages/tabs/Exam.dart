import 'package:flutter/material.dart';

import 'package:kkt/pages/exam/ExamList.dart';

/// 考试
class ExamPage extends StatefulWidget {
  ExamPage({Key key}) : super(key: key);

  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('考试管理'),
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Tab(
                text: '正式考试',
              ),
              Tab(
                text: '模拟考试',
              ),
              Tab(
                text: '练习考试',
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/exam/create');
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ExamListPage(),
            ExamListPage(),
            ExamListPage(),
          ],
        ),
      ),
    );
  }
}
