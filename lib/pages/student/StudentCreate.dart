import 'package:flutter/material.dart';
import 'package:kkt/utils/screen_util.dart';

class StudentCreatePage extends StatefulWidget {
  StudentCreatePage({Key key}) : super(key: key);

  @override
  _StudentCreatePageState createState() => _StudentCreatePageState();
}

class _StudentCreatePageState extends State<StudentCreatePage> {
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _surNameController = new TextEditingController();
  var _surInfoController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加考生'),
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
                    '添加考生',
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
                      '考生姓名',
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
                      hintText: "请输入考生姓名",
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
                      '考生手机号',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextField(
                    style: hintTips,
                    // maxLines: 4,
                    controller: _surInfoController,
                    decoration: new InputDecoration(
                        hintText: "请输入手机号", border: OutlineInputBorder()),
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
