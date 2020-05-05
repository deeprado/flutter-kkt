import 'package:flutter/cupertino.dart';

class SurveyListPage extends StatefulWidget {
  SurveyListPage({Key key}) : super(key: key);

  @override
  _SurveyListPageState createState() => _SurveyListPageState();
}

class _SurveyListPageState extends State<SurveyListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('问卷列表'),
    );
  }
}