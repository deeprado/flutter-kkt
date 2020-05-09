import 'package:flutter/material.dart';

import 'package:kkt/utils/screen_util.dart';

/// 创建问卷
class SurveyCreatePage extends StatefulWidget {
  SurveyCreatePage({Key key}) : super(key: key);

  @override
  _SurveyCreatePageState createState() => _SurveyCreatePageState();
}

class _SurveyCreatePageState extends State<SurveyCreatePage> {
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _surNameController = new TextEditingController();
  var _surInfoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("创建问卷"),
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                Container(
                  height: 160,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/survey_create.png")),
                  ),
                  child: Text(
                    '创建问卷',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/images/survey_title.png"),
                    ),
                    Text(
                      '问卷标题',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextField(
                    style: hintTips,
                    controller: _surNameController,
                    decoration: new InputDecoration(
                      hintText: "请输入问卷标题",
                    ),
                    obscureText: false,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/images/survey_describe.png"),
                    ),
                    Text(
                      '问卷描述',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextField(
                    style: hintTips,
                    maxLines: 4,
                    controller: _surInfoController,
                    decoration: new InputDecoration(
                        hintText: "请输入问卷描述", border: OutlineInputBorder()),
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
                        '立即创建',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
