import 'package:flutter/material.dart';

import 'package:kkt/widget/GradientButton.dart';

class WidghtPage extends StatefulWidget {
  WidghtPage({Key key}) : super(key: key);

  @override
  _WidghtPageState createState() => _WidghtPageState();
}

class _WidghtPageState extends State<WidghtPage> {
  onTap() {
    print("button click");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件示例'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('aaa'),
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300], Colors.blueAccent],
              child: Text("Submit"),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
