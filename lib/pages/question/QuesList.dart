import 'package:flutter/material.dart';

import 'package:kkt/pages/question/QuesCell.dart';

class QuesListPage extends StatefulWidget {
  QuesListPage({Key key}) : super(key: key);

  @override
  _QuesListPageState createState() => _QuesListPageState();
}

class _QuesListPageState extends State<QuesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('题目列表'),
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
                QuesCell(),
                SizedBox(
                  height: 10,
                ),
                QuesCell(),
                SizedBox(
                  height: 10,
                ),
                QuesCell(),
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
