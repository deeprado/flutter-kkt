import 'package:flutter/material.dart';

class StudentCreatePage extends StatefulWidget {
  StudentCreatePage({Key key}) : super(key: key);

  @override
  _StudentCreatePageState createState() => _StudentCreatePageState();
}

class _StudentCreatePageState extends State<StudentCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('添加考生'),
        ),
        body: Center(
          child: Text('添加考生'),
        ));
  }
}
