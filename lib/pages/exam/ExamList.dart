import 'package:flutter/material.dart';

import 'package:kkt/pages/exam/ExamCell.dart';

class ExamListPage extends StatefulWidget {
  ExamListPage({Key key}) : super(key: key);

  @override
  _ExamListPageState createState() => _ExamListPageState();
}

class _ExamListPageState extends State<ExamListPage> {
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      shrinkWrap: true,
      // 内容
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
              ExamCell(),
              SizedBox(
                height: 10,
              ),
              ExamCell(),
              SizedBox(
                height: 10,
              ),
              ExamCell(),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
