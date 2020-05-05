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
                                  Image.asset(
                                    "assets/images/line.png",
                                    fit: BoxFit.contain,
                                    height: 100.0,
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
                                  Image.asset(
                                    "assets/images/line.png",
                                    fit: BoxFit.contain,
                                    height: 100.0,
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
                                  Image.asset(
                                    "assets/images/line.png",
                                    fit: BoxFit.contain,
                                    height: 100.0,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: Image.asset("assets/images/zhanshi1.png"),
                        ),
                        Center(
                          child: FLCopyableLabel(
                            copyData: '党建知识考试',
                            showMenu: true,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('党建知识考试',
                                  style: TextStyle(fontSize: 16, height: 1.5)),
                            ),
                            afterCopyCallback: () {},
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: Image.asset("assets/images/zhanshi2.png"),
                        ),
                        Center(
                          child: FLCopyableLabel(
                            copyData: '消防知识考试',
                            showMenu: true,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('消防知识考试',
                                  style: TextStyle(fontSize: 16, height: 1.5)),
                            ),
                            afterCopyCallback: () {},
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: Image.asset("assets/images/zhanshi3.png"),
                        ),
                        Center(
                          child: FLCopyableLabel(
                            copyData: '旗舰员工培训考核',
                            showMenu: true,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('旗舰员工培训考核',
                                  style: TextStyle(fontSize: 16, height: 1.5)),
                            ),
                            afterCopyCallback: () {},
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: Image.asset("assets/images/zhanshi4.png"),
                        ),
                        Center(
                          child: FLCopyableLabel(
                            copyData: '职业卫生知识考核',
                            showMenu: true,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('职业卫生知识考核',
                                  style: TextStyle(fontSize: 16, height: 1.5)),
                            ),
                            afterCopyCallback: () {},
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
}
