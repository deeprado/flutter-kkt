import 'package:flutter/material.dart';
// import 'package:flui/flui.dart';

import 'package:kkt/utils/screen_util.dart';

import 'package:kkt/pages/drawer/HomeDrawer.dart';
import 'package:kkt/pages/drawer/Menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil()..init(context);

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 20,
          height: 20,
          child: Image.asset("assets/images/chat.png"),
        ),
        onPressed: () {
          print('进入反馈');
          Navigator.pushNamed(context, '/feedback');
        },
      ),
      appBar: AppBar(
        title: Text("快考题"),
        centerTitle: false,
        leading: IconButton(
          iconSize: 48,
          icon: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.fill,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Navigator.pushNamed(context, '/demo/fluwx');
            },
          ),
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
          IconButton(
            icon: Icon(Icons.layers),
            onPressed: () {
              Navigator.pushNamed(context, '/tabs');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/user');
            },
          )
        ],
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        // 内容
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/index_banner.png",
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/index_icon1.png",
                              fit: BoxFit.contain,
                              height: 54.0,
                              width: 54.0,
                            ),
                            Text(
                              '极速创建',
                              style: TextStyle(
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                  fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/index_icon2.png",
                              fit: BoxFit.contain,
                              height: 54.0,
                              width: 54.0,
                            ),
                            Text('便捷管理',
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/index_icon3.png",
                              fit: BoxFit.contain,
                              height: 54.0,
                              width: 54.0,
                            ),
                            Text('数据统计',
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/index_icon4.png",
                              fit: BoxFit.contain,
                              height: 54.0,
                              width: 54.0,
                            ),
                            Text('在线考试',
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/index_icon5.png",
                              fit: BoxFit.contain,
                              height: 54.0,
                              width: 54.0,
                            ),
                            Text('全网加速',
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color.fromRGBO(247, 248, 250, 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                                height: 140.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          2.0, 5.0, 2.0, 5.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(207, 230, 253, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  0, 155, 249, 1),
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Text(
                                        'Step1',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 155, 249, 1)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/line.png",
                                        fit: BoxFit.contain,
                                        height: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '创建考试',
                                        style: TextStyle(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(
                                        '3分钟完成考试创建，极简操作，节约时间，考试模式多样，考前预约，阅卷高效',
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 13,
                                            height: 1.8,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.white,
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Image.asset(
                                        "assets/images/index_step1.png"),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                                height: 140.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          2.0, 5.0, 2.0, 5.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(207, 230, 253, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  0, 155, 249, 1),
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Text(
                                        'Step2',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 155, 249, 1)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/line.png",
                                        fit: BoxFit.contain,
                                        height: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '添加考题',
                                        style: TextStyle(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(
                                        '图片，音频考题快速上传，自建考试题库，自由编辑，更支持一键高速上传，省时更省心',
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 13,
                                            height: 1.8,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.white,
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Image.asset(
                                        "assets/images/index_step2.png"),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                                height: 140.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          2.0, 5.0, 2.0, 5.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(207, 230, 253, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  0, 155, 249, 1),
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Text(
                                        'Step3',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 155, 249, 1)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        "assets/images/line.png",
                                        fit: BoxFit.contain,
                                        height: 100.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '分享考试',
                                        style: TextStyle(
                                          color: Color.fromRGBO(51, 51, 51, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(
                                        '渠道分享模式，不受平台限制，自动生成二维码，扫码快速进入，强化移动考试',
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 13,
                                            height: 1.8,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.white,
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Image.asset(
                                        "assets/images/index_step3.png"),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: Container(
                            height: 36,
                            width: ScreenUtil.screenWidth / 2,
                            child: RaisedButton(
                              child: Text(
                                '免费创建',
                                style: TextStyle(fontSize: 12),
                              ),
                              textColor: Colors.white,
                              color: Color.fromRGBO(72, 133, 247, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                print("普通按钮");
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Color.fromRGBO(247, 248, 250, 1),
                  ),
                ),
              ]),
            ),
          ),
          new SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                Container(
                  width: ScreenUtil.screenWidth,
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      width: ScreenUtil.screenWidth / 2,
                      child: Image.asset("assets/images/scene.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: ScreenUtil.screenWidth,
                  color: Colors.white,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0, //水平子 Widget 之间间距
                    mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
                    padding: EdgeInsets.all(5),
                    children: this._getList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      ' -- 已经到底了 -- ',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: new HomeDrawerPage(key: Key('1111')),
      ),
      endDrawer: new Drawer(
        child: new MenuPage(key: Key('2222')),
      ),
    );
  }

  List<Widget> _getList() {
    List listData = [
      {
        'title': '党建知识考试',
        'img': 'assets/images/zhanshi1.png',
      },
      {
        'title': '消防安全知识考试',
        'img': 'assets/images/zhanshi2.png',
      },
      {
        'title': '旗舰员工培训考核',
        'img': 'assets/images/zhanshi3.png',
      },
      {
        'title': '职业卫生知识考核',
        'img': 'assets/images/zhanshi4.png',
      },
    ];
    var tempList = listData.map((value) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: (ScreenUtil.screenWidth - 60) / 2,
              child: AspectRatio(
                aspectRatio: 15 / 12,
                child: Image.asset(value['img']),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  value['title'],
                  style: TextStyle(height: 1.5),
                ),
              ),
            ),
          ],
        ),
      );
    });

    return tempList.toList();
  }
}
