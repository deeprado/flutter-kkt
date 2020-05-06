import 'package:flutter/material.dart';

import 'package:kkt/pages/bank/BankCell.dart';

/// 题库

class BankPage extends StatefulWidget {
  BankPage({Key key}) : super(key: key);

  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  var _bankNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('题库管理'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  child: new AlertDialog(
                    title: new Text("添加题库"),
                    content: new TextField(
                      style: hintTips,
                      controller: _bankNameController,
                      decoration: new InputDecoration(
                          hintText: "请输入题库名称", icon: Icon(Icons.ac_unit)),
                      obscureText: false,
                    ),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: new Text("确定")),
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            print("点击取消------");
                          },
                          child: new Text("取消")),
                    ],
                  ));
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
                BankCell(),
                SizedBox(
                  height: 10,
                ),
                BankCell(),
                SizedBox(
                  height: 10,
                ),
                BankCell(),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
