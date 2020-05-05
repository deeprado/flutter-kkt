import 'package:flutter/material.dart';

import 'package:kkt/pages/survey/SurveyCell.dart';

/// 问卷

class SurveyPage extends StatefulWidget {
  SurveyPage({Key key}) : super(key: key);

  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('问卷管理'),
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
        body: new CustomScrollView(
          shrinkWrap: true,
          // 内容
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
                  SurveyCell(),
                  SizedBox(
                    height: 10,
                  ),
                  SurveyCell(),
                  SizedBox(
                    height: 10,
                  ),
                  SurveyCell(),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
