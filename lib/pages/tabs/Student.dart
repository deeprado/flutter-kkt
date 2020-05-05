import 'package:flutter/material.dart';

import 'package:kkt/widget/LoadingDialog.dart';

import 'package:kkt/pages/student/StudentCell.dart';

import 'package:kkt/pages/drawer/StudentDrawer.dart';

/// 考生
///

class StudentPage extends StatefulWidget {
  StudentPage({Key key}) : super(key: key);

  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('考生管理'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                  context: context, //BuildContext对象
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return new LoadingDialog(
                      //调用对话框
                      text: '正在获取详情...',
                    );
                  });
            },
          ),
          IconButton(
            icon: Icon(Icons.label_important),
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
      endDrawer: new Drawer(
        child: new StudentDrawerPage(),
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                StudentCell(),
                SizedBox(
                  height: 10,
                ),
                StudentCell(),
                SizedBox(
                  height: 10,
                ),
                StudentCell(),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
