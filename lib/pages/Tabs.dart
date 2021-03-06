import 'package:flutter/material.dart';
import 'package:kkt/pages/drawer/Menu.dart';

import 'tabs/Exam.dart';
import 'tabs/Survey.dart';
import 'tabs/Bank.dart';
import 'tabs/Student.dart';

import 'drawer/TabDrawer.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;
  _TabsState(index) {
    this._currentIndex = index;
  }

  List _pageList = [
    ExamPage(),
    SurveyPage(),
    BankPage(),
    StudentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("快考题"),
      // ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, // 配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            // 改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 36.0, // icon的大小
        fixedColor: Theme.of(context).accentColor, // 选中的颜色
        type: BottomNavigationBarType.fixed, // 配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.widgets), title: Text("考试")),
          BottomNavigationBarItem(
              icon: Icon(Icons.next_week), title: Text("问卷")),
          BottomNavigationBarItem(
              icon: Icon(Icons.text_fields), title: Text("题库")),
          BottomNavigationBarItem(icon: Icon(Icons.group), title: Text("考生"))
        ],
      ),
      drawer: Drawer(child: new TabDrawerPage()),
      endDrawer: Drawer(child: new MenuPage()),
    );
  }
}
