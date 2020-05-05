import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

import 'package:kkt/utils/screen_util.dart';

import 'package:kkt/pages/drawer/HomeDrawer.dart';

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
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/exam/create');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search');
              // Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('settings');
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
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        height: 300.0,
                        child: Image.asset(
                          "assets/images/index_banner.png",
                          fit: BoxFit.contain,
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
                            Text('全网加速')
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
                            Text('全网加速')
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
                            Text('全网加速')
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
                            Text('全网加速')
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
                            Text('全网加速')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  child: Container(
                    color: Colors.black12,
                  ),
                ),
                Column(
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
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              height: 140.0,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                            color: Colors.pink, width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text('step1'),
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
                          flex: 6,
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.white,
                                    child: Text(
                                      '创建考试创建考试创建考试创建考试创建考试',
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
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
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              height: 140.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                            color: Colors.pink, width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text('step1'),
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
                          flex: 6,
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.white,
                                    child: Text(
                                      '创建考试创建考试创建考试创建考试创建考试',
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
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
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              height: 140.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                            color: Colors.pink, width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text('step1'),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      "assets/images/line.png",
                                      fit: BoxFit.fitHeight,
                                      height: 100.0,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 6,
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    color: Colors.white,
                                    child: Text(
                                      '创建考试创建考试创建考试创建考试创建考试',
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
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
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          width: 200,
                          child: RaisedButton(
                            child: Text('免费创建'),
                            textColor: Colors.white,
                            color: Colors.blue,
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
                )
              ]),
            ),
          ),
          new SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      width: 300,
                      child: Image.asset("assets/images/scene.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0, //水平子 Widget 之间间距
                    mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
                    padding: EdgeInsets.all(5),
                    children: this._getList(),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: new HomeDrawerPage(),
      ),
    );
  }

  List<Widget> _getList() {
    List listData = [
      {
        'title': 'aaa',
        'img': 'assets/images/zhanshi1.png',
      },
      {
        'title': 'aaa',
        'img': 'assets/images/zhanshi2.png',
      },
      {
        'title': 'aaa',
        'img': 'assets/images/zhanshi3.png',
      },
      {
        'title': 'aaa',
        'img': 'assets/images/zhanshi4.png',
      },
    ];
    var tempList = listData.map((value) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: Image.asset(value['img']),
            ),
            Expanded(
              child: Container(
                child: Text(value['title']),
              ),
            ),
          ],
        ),
      );
    });

    return tempList.toList();
  }
}
