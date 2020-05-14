import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({Key key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('忘记密码'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Text('忘记密码'),
        ),
      ),
    );
  }
}
