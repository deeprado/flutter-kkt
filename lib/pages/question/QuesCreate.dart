import 'package:flutter/material.dart';
import 'package:kkt/utils/screen_util.dart';

class QuesCreatePage extends StatefulWidget {
  QuesCreatePage({Key key}) : super(key: key);

  @override
  _QuesCreatePageState createState() => _QuesCreatePageState();
}

class _QuesCreatePageState extends State<QuesCreatePage> {
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _quesTitleController = new TextEditingController();
  var _quesAnaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('添加题目'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/editor');
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/images/survey_describe.png"),
                    ),
                    Text(
                      '考题类型',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  // direction: Axis.vertical,
                  // alignment:WrapAlignment.spaceEvenly,
                  // runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('单选题'),
                    Text('多选题'),
                    Text('判断题'),
                    Text('填空题'),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/images/survey_describe.png"),
                    ),
                    Text(
                      '考题难度',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  // direction: Axis.vertical,
                  // alignment:WrapAlignment.spaceEvenly,
                  // runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('简单'),
                    Text('普通'),
                    Text('困难'),
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset("assets/images/survey_describe.png"),
                ),
                Text(
                  '考题题目',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: new TextField(
                style: hintTips,
                maxLines: 4,
                controller: _quesTitleController,
                decoration: new InputDecoration(
                    hintText: "请输入考题题目", border: OutlineInputBorder()),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset("assets/images/survey_describe.png"),
                ),
                Text(
                  '考题解析',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: new TextField(
                style: hintTips,
                maxLines: 4,
                controller: _quesAnaController,
                decoration: new InputDecoration(
                    hintText: "请输入题目解析", border: OutlineInputBorder()),
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: ScreenUtil.screenWidth / 2,
                height: 50,
                child: RaisedButton(
                  child: Text(
                    '立即添加',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    print('xx');
                  },
                ),
              ),
            )
          ],
        ));
  }
}
