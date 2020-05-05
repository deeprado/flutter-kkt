import 'package:flutter/cupertino.dart';

class StudentListPage extends StatefulWidget {
  StudentListPage({Key key}) : super(key: key);

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('问卷列表'),
    );
  }
}