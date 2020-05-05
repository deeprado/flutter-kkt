import 'package:flutter/material.dart';

import 'package:kkt/pages/question/BankCell.dart';

/// 题库

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('题库管理'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/ques/create');
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
      body: new CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                BankCell(),
                SizedBox(
                  height: 10,
                ),
                BankCell(),
                SizedBox(
                  height: 10,
                ),
                BankCell(),
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
